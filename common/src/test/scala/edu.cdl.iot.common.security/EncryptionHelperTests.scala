package edu.cdl.iot.test.common.security


import edu.cdl.iot.common.security.EncryptionHelper
import javax.crypto.KeyGenerator
import org.scalatest._
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should

import scala.collection.mutable

class EncryptionHelperTests extends AnyFlatSpec with should.Matchers {

  "Encryption" should "Be two way" in {
    val generator = KeyGenerator.getInstance("AES")
    generator.init(128)
    val key = generator.generateKey()
    val secret = key.getEncoded
    val plaintext = "my_secret"
    val cyptertext = EncryptionHelper.encrypt(secret, plaintext.getBytes(EncryptionHelper.charset))
    val decoded = new String(EncryptionHelper.decrypt(secret, cyptertext), EncryptionHelper.charset)
    decoded should be(plaintext)
  }
}