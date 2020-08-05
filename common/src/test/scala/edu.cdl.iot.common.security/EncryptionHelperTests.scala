package edu.cdl.iot.common.security

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
}