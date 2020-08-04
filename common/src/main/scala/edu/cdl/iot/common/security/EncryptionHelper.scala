package edu.cdl.iot.common.security

import java.nio.charset.StandardCharsets
import java.security.SecureRandom

import javax.crypto.Cipher
import javax.crypto.spec.{IvParameterSpec, SecretKeySpec}

import scala.util.{Failure, Try}

object EncryptionHelper {
  val cipher = Cipher.getInstance("AES/CBC/PKCS5Padding")
  val charset = StandardCharsets.UTF_8

  def encrypt(key: Array[Byte], input: Array[Byte]): Array[Byte] = {
    val secretBytes = new SecretKeySpec(key, "AES")
    cipher.init(Cipher.ENCRYPT_MODE, secretBytes, new SecureRandom())
    cipher.getIV ++ cipher.doFinal(input)
  }

  def encrypt(key: String, input: String): String =
    new String(encrypt(key.getBytes(charset), input.getBytes(charset)), charset)

  def decrypt(key: Array[Byte], input: Array[Byte]): Array[Byte] = {
    val secretBytes = new SecretKeySpec(key, "AES")
    cipher.init(Cipher.DECRYPT_MODE, secretBytes, new IvParameterSpec(input.slice(0, 16)))
    cipher.doFinal(input.slice(16, input.length))
  }

  def decrypt(key: String, input: String): String =
    new String(decrypt(key.getBytes(charset), input.getBytes(charset)), charset)
}
