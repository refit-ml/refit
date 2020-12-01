from refit.util.EncryptionHelper import EncryptionMode, EncryptionHelper

key = "keyboard_cat"
salt = "project_guid"

encrypt = EncryptionHelper(key, salt)
decrypt = EncryptionHelper(key, salt, EncryptionMode.DECRYPT)


def test_decryption_works():
    plain_text = "my_secret"
    ciphertext = "rnVzGCY9DPiotFtcHJFOniL5Jr3gmZKXMUfOdz1FiXI="
    decrypt.transform(ciphertext)
    assert True


def test_decryption_can_decrypt_scala_cyphertext():
    plain_text = "my_secret"
    scala_cyphertext = "1rO7F19Kjij2OthY36EzhO2i8d210+XlQ8qlhqEzY/w="
    decoded = decrypt.transform(scala_cyphertext)
    assert plain_text == decoded


def test_decryption_should_work_with_guids():
    plain_text = "efc4b912-aa0d-40c1-99a2-08fbf9f88282"
    scala_ciphertext = "1rO7F19Kjij2OthY36EzhPSsDtPRh2R8ZEgCJtsZG6G737PcPkM0Xb9OLk3x1JVkBewjJTm3kVh3qZgnMNuiiw=="
    decoded = decrypt.transform(scala_ciphertext)
    assert plain_text == decoded


def test_throws_error_on_bad_mode():
    try:
        EncryptionHelper(key, salt, 3).transform("asdf")
        assert False
    except:
        assert True
