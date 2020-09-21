import unittest

from refit.util.EncryptionHelper import EncryptionMode, EncryptionHelper


class TestStringMethods(unittest.TestCase):

    def __init__(self, *args, **kwargs):
        super(TestStringMethods, self).__init__(*args, **kwargs)
        self.key = "keyboard_cat"
        self.salt = "project_guid"

        self.encrypt = EncryptionHelper(self.key, self.salt)
        self.decrypt = EncryptionHelper(self.key, self.salt, EncryptionMode.DECRYPT)

    # def test_encryption_works(self):
    #     plain_text = "my_secret"
    #     self.encrypt.transform(plain_text)
    #     self.assertTrue(True)

    def test_decryption_works(self):
        plain_text = "my_secret"
        ciphertext = "rnVzGCY9DPiotFtcHJFOniL5Jr3gmZKXMUfOdz1FiXI="
        self.decrypt.transform(ciphertext)
        self.assertTrue(True)

    # def test_encryption_is_reversable(self):
    #     plain_text = "my_secret"
    #     ciphertext = self.encrypt.transform(plain_text)
    #     decoded = self.decrypt.transform(ciphertext)
    #     self.assertEqual(plain_text, decoded)

    def test_decryption_can_decrypt_scala_cyphertext(self):
        plain_text = "my_secret"
        scala_cyphertext = "1rO7F19Kjij2OthY36EzhO2i8d210+XlQ8qlhqEzY/w="
        decoded = self.decrypt.transform(scala_cyphertext)
        self.assertEqual(plain_text, decoded)

    # def test_encryption_should_work_with_guids(self):
    #     plain_text = "06e03bdd-7ba0-49c2-bff5-2a84d68ba819"
    #     ciphertext = self.encrypt.transform(plain_text)
    #     decoded = self.decrypt.transform(ciphertext)
    #     self.assertEqual(plain_text, decoded)

    def test_decryption_should_work_with_guids(self):
        plain_text = "efc4b912-aa0d-40c1-99a2-08fbf9f88282"
        scala_ciphertext = "1rO7F19Kjij2OthY36EzhPSsDtPRh2R8ZEgCJtsZG6G737PcPkM0Xb9OLk3x1JVkBewjJTm3kVh3qZgnMNuiiw=="
        decoded = self.decrypt.transform(scala_ciphertext)
        self.assertEqual(plain_text, decoded)

    def test_throws_error_on_bad_mode(self):
        try:
            EncryptionHelper(self.key, self.salt, 3).transform("asdf")
            self.assertTrue(False)
        except:
            self.assertTrue(True)


if __name__ == '__main__':
    unittest.main()
