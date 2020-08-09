package edu.cdl.iot.common.security

import java.util.UUID

import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should


class EncryptionHelperTests extends AnyFlatSpec with should.Matchers {

  "Encryption" should "Be two way" in {
    val key = "keyboard_cat"
    val plaintext = "my_secret"
    val cyptertext = EncryptionHelper.encrypt(key, plaintext)
    val decoded = EncryptionHelper.decrypt(key, cyptertext)
    decoded should be(plaintext)
  }

  "Encryption" should "Work on GUIDs" in {
    val key = "keyboard_cat"
    val plaintext = UUID.randomUUID().toString
    val cyptertext = EncryptionHelper.encrypt(key, plaintext)
    val decoded = EncryptionHelper.decrypt(key, cyptertext)
    decoded should be(plaintext)
  }

  "Decryption" should "Work from Python ciphertext" in {
    val key = "keyboard_cat"
    val plaintext = "my_secret"
    val pythonCiphertext = "aueeTghCH7YO8UCECk7Qx0illjsksf9oaR+JuEp1gzY="
    val decoded = EncryptionHelper.decrypt(key, pythonCiphertext)
    decoded should be (plaintext)
  }

  "Decryption" should "Work from Python guids" in {
    val key = "keyboard_cat"
    val plaintext = "06e03bdd-7ba0-49c2-bff5-2a84d68ba819"
    val pythonCiphertext = "zH4kRYXeBr/3lq7McQBPvmnfOmGB88+uKhTFuRzg56JbV0H73QhY+Lqkqdb4maopLfDHZ6rFoqpNFDwDOOkQcw=="
    val decoded = EncryptionHelper.decrypt(key, pythonCiphertext)
    decoded should be (plaintext)
  }
}