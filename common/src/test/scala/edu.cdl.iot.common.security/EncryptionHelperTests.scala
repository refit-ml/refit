package edu.cdl.iot.common.security

import java.util.UUID

import javax.crypto.Cipher
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should


class EncryptionHelperTests extends AnyFlatSpec with should.Matchers {
  val encryption = new EncryptionHelper("keyboard_cat", "project_guid")
  val decryption = new EncryptionHelper("keyboard_cat", "project_guid", Cipher.DECRYPT_MODE)

  "Encryption" should "Be two way" in {
    val plaintext = "my_secret"
    val cyptertext = encryption.transform(plaintext)
    val decoded = decryption.transform(cyptertext)
    decoded should be(plaintext)
  }

  "Encryption" should "Work on GUIDs" in {
    val key = "keyboard_cat"
    val plaintext = UUID.randomUUID().toString
    val cyptertext = encryption.transform(plaintext)
    val decoded = decryption.transform(cyptertext)
    decoded should be(plaintext)
  }

  "Decryption" should "Work from Python ciphertext" in {
    val key = "keyboard_cat"
    val plaintext = "my_secret"
    val pythonCiphertext = "GkTOmhVaRVbf5vEA1CvRUnsNel08y70RAuls9JUiU8c="
    val decoded = decryption.transform(pythonCiphertext)
    decoded should be(plaintext)
  }

  "Decryption" should "Work from Python guids" in {
    val plaintext = "06e03bdd-7ba0-49c2-bff5-2a84d68ba819"
    val pythonCiphertext = "GkTOmhVaRVbf5vEA1CvRUp91QrwSMouG7hP5VLpt9Xns7qxMIOD3wkmjtaWMOng9gBYFxMUybtNz2wVA3yqC7w=="
    val decoded = decryption.transform(pythonCiphertext)
    decoded should be(plaintext)
  }

  "Encryption" should "Work with map for an input" in {
    val input = Map(
      "foo" -> "bar"
    )
    val output = decryption.transform(encryption.transform(input))
    output.size should be(1)
    output("foo") should be("bar")
  }
}