import base64
import hashlib

from Crypto import Random
from Crypto.Cipher import AES

block_size = 16
pad = lambda s: s + (block_size - len(s) % block_size) * chr(block_size - len(s) % block_size)
unpad = lambda s: s[0:-ord(s[-1:])]
iv = Random.new().read(AES.block_size)  # Random IV

class EncryptionHelper:
    # TODO: Use a proper salt with project GUID eventually
    @staticmethod
    def salt(n):
        return "anySaltYouCanUseOfOn"

    @staticmethod
    def get_private_key(secret_key, salt):
        return hashlib.pbkdf2_hmac('SHA256', secret_key.encode(), salt.encode(), 65536, 32)

    @staticmethod
    def encrypt_with_AES(message, secret_key, salt):
        private_key = EncryptionHelper.get_private_key(secret_key, salt)
        message = pad(message)
        cipher = AES.new(private_key, AES.MODE_CBC, iv)
        cipher_bytes = base64.b64encode(iv + cipher.encrypt(message))
        return bytes.decode(cipher_bytes)

    @staticmethod
    def decrypt_with_AES(encoded, secret_key, salt):
        private_key = EncryptionHelper.get_private_key(secret_key, salt)
        cipher_text = base64.b64decode(encoded)
        iv = cipher_text[:AES.block_size]
        cipher = AES.new(private_key, AES.MODE_CBC, iv)
        plain_bytes = unpad(cipher.decrypt(cipher_text[block_size:]));
        return bytes.decode(plain_bytes)

    # Public "Pretty" Methods
    @staticmethod
    def encrypt(key, input):
        return EncryptionHelper.encrypt_with_AES(input, key, EncryptionHelper.salt(input))

    @staticmethod
    def decrypt(key, input):
        return EncryptionHelper.decrypt_with_AES(input, key, EncryptionHelper.salt(input))

