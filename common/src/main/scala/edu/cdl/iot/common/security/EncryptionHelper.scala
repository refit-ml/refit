package edu.cdl.iot.common.security

import java.security.SecureRandom
import java.util
import java.util.Base64

import javax.crypto.{Cipher, SecretKeyFactory}
import javax.crypto.spec.{IvParameterSpec, PBEKeySpec, SecretKeySpec}

object EncryptionHelper {
  private val factoryInstance = "PBKDF2WithHmacSHA256"
  private val cipherInstance = "AES/CBC/PKCS5PADDING"
  private val secretKeyType = "AES"
  private val ivCode = new Array[Byte](16)
  private val saltOfN = "anySaltYouCanUseOfOn"

  // Public "Pretty" methods
  def encrypt(key: String, input: String): String = encrypt(key, saltOfN, input)
  def decrypt(key: String, input: String): String = decrypt(key, saltOfN, input)


  // Private "Ugly" methods
  private def encrypt(secretKey: String, salt: String, value: String): String = {
    val cipher = initCipher(secretKey, salt, Cipher.ENCRYPT_MODE)
    val encrypted = cipher.doFinal(value.getBytes)
    val cipherWithIv = addIVToCipher(encrypted)
    Base64.getEncoder.encodeToString(cipherWithIv)
  }


  private def decrypt(secretKey: String, salt: String, encrypted: String): String = {
    val cipher = initCipher(secretKey, salt, Cipher.DECRYPT_MODE)
    val original = cipher.doFinal(Base64.getDecoder.decode(encrypted))
    val originalWithoutIv = util.Arrays.copyOfRange(original, 16, original.length)
    new String(originalWithoutIv)
  }


  private def initCipher(secretKey: String, salt: String, mode: Int) = {
    val factory = SecretKeyFactory.getInstance(factoryInstance)
    val spec = new PBEKeySpec(secretKey.toCharArray, salt.getBytes, 65536, 256)
    val tmp = factory.generateSecret(spec)
    val skeySpec = new SecretKeySpec(tmp.getEncoded, secretKeyType)
    val cipher = Cipher.getInstance(cipherInstance)
    // Generating random IV
    val random = new SecureRandom
    random.nextBytes(ivCode)
    cipher.init(mode, skeySpec, new IvParameterSpec(ivCode))
    cipher
  }

  private def addIVToCipher(encrypted: Array[Byte]) = {
    val cipherWithIv = new Array[Byte](ivCode.length + encrypted.length)
    System.arraycopy(ivCode, 0, cipherWithIv, 0, ivCode.length)
    System.arraycopy(encrypted, 0, cipherWithIv, ivCode.length, encrypted.length)
    cipherWithIv
  }
}
