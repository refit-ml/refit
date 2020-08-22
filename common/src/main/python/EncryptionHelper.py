import base64
import hashlib
from enum import Enum

from Crypto import Random
from Crypto.Cipher import AES


class EncryptionMode(Enum):
    ENCRYPT = 1
    DECRYPT = 2


class EncryptionHelper:
    # TODO: Use a proper salt with project GUID eventually
    def __init__(self, key, salt, mode=EncryptionMode.ENCRYPT, key_scheme='SHA1'):
        self.key = key
        self.salt = salt
        self.mode = mode
        self.key_scheme = key_scheme
        self.private_key = hashlib.pbkdf2_hmac(self.key_scheme, self.key.encode(), self.salt.encode(), 65536, 32)

        self.block_size = 16
        self.pad = lambda s: s + (self.block_size - len(s) % self.block_size) * chr(
            self.block_size - len(s) % self.block_size)
        self.unpad = lambda s: s[0:-ord(s[-1:])]
        self.iv = Random.new().read(AES.block_size)

    def get_private_key(self, secret_key, salt):
        return

    def transform(self, input):
        if self.mode == EncryptionMode.ENCRYPT:
            return self.__encrypt(input)
        elif self.mode == EncryptionMode.DECRYPT:
            return self.__decrypt(input)
        else:
            raise Exception(
                f'Mode {self.mode} not supported. only Encryption ({EncryptionMode.ENCRYPT}) and Decryption ({EncryptionMode.DECRYPT}) are supported')

    def __encrypt(self, message):
        private_key = self.private_key
        message = self.pad(message)
        cipher = AES.new(private_key, AES.MODE_CBC, self.iv)
        cipher_bytes = base64.b64encode(self.iv + cipher.encrypt(message))
        return bytes.decode(cipher_bytes)

    def __decrypt(self, encoded):
        private_key = self.private_key
        cipher_text = base64.b64decode(encoded)
        iv = cipher_text[:AES.block_size]
        cipher = AES.new(private_key, AES.MODE_CBC, iv)
        plain_bytes = self.unpad(cipher.decrypt(cipher_text[self.block_size:]));
        return bytes.decode(plain_bytes)
