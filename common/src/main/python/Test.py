import unittest

from EncryptionHelper import EncryptionHelper


class TestStringMethods(unittest.TestCase):

    def test_encryption_works(self):
        secret_key = "keyboard_cat"
        plain_text = "my_secret"
        EncryptionHelper.encrypt(secret_key, plain_text)
        self.assertTrue(True)

    def test_decryption_works(self):
        secret_key = "keyboard_cat"
        plain_text = "my_secret"
        ciphertext = "rnVzGCY9DPiotFtcHJFOniL5Jr3gmZKXMUfOdz1FiXI="
        EncryptionHelper.decrypt(secret_key, ciphertext)
        self.assertTrue(True)

    def test_encryption_is_reversable(self):
        secret_key = "keyboard_cat"
        plain_text = "my_secret"
        ciphertext = EncryptionHelper.encrypt(secret_key, plain_text)
        decoded = EncryptionHelper.decrypt(secret_key, ciphertext)
        self.assertEqual(plain_text, decoded)

    def test_decryption_can_decrypt_scala_cyphertext(self):
        secret_key = "keyboard_cat"
        plain_text = "my_secret"
        scala_cyphertext = "HUJ842xoChm9sxuovH9bGj7g/IZYWWnbk76ZWJsv/84="
        decoded = EncryptionHelper.decrypt(secret_key, scala_cyphertext)
        self.assertEqual(plain_text, decoded)

    def test_encryption_should_work_with_guids(self):
        secret_key = "keyboard_cat"
        plain_text = "06e03bdd-7ba0-49c2-bff5-2a84d68ba819"
        ciphertext = EncryptionHelper.encrypt(secret_key, plain_text)
        decoded = EncryptionHelper.decrypt(secret_key, ciphertext)
        self.assertEqual(plain_text, decoded)

    def test_decryption_should_work_with_guids(self):
        secret_key = "keyboard_cat"
        plain_text = "06e03bdd-7ba0-49c2-bff5-2a84d68ba819"
        scala_ciphertext = "xRJCat6rorK5UvF7IvDvjp7gkgtcikKphZtPyjPJ59Of1q4nUz638jrfTomruA89KPAE0obYzFmqxNegHjVHqA=="
        decoded = EncryptionHelper.decrypt(secret_key, scala_ciphertext)
        self.assertEqual(plain_text, decoded)



if __name__ == '__main__':
    unittest.main()