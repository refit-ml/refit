package edu.cdl.iot.common.security

import java.security.SecureRandom
import java.util
import java.util.Base64

import javax.crypto.{Cipher, SecretKeyFactory}
import javax.crypto.spec.{IvParameterSpec, PBEKeySpec, SecretKeySpec}


class EncryptionHelper(val key: String,
                       val salt: String,
                       val mode: Int = Cipher.ENCRYPT_MODE,
                       val keyScheme: String = "SHA1") extends Serializable {
  private val factoryInstance = s"PBKDF2WithHmac${keyScheme}"
  private val cipherInstance = "AES/CBC/PKCS5PADDING"
  private val secretKeyType = "AES"
  private val ivCode = new Array[Byte](16)
  @transient lazy private val cipher = initCipher(key, salt, mode)

  def transform(input: Map[String, String]): Map[String, String] = input.map({
    case (x, d) =>
      transform(x) -> transform(d)
  })

  def transform(input: String): String = mode match {
    case Cipher.ENCRYPT_MODE => encrypt(input)
    case Cipher.DECRYPT_MODE => decrypt(input)
    case _ => throw new IllegalAccessException(
      s"Mode ${mode} not supported, only Encrypt (${Cipher.ENCRYPT_MODE}) and Decrypt (${Cipher.DECRYPT_MODE}) are supported"
    )
  }

  // Private "Ugly" methods
  private def encrypt(value: String): String = {
    val encrypted = cipher.doFinal(value.getBytes)
    val cipherWithIv = addIVToCipher(encrypted)
    Base64.getEncoder.encodeToString(cipherWithIv)
  }


  private def decrypt(encrypted: String): String = {
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
