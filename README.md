# AES_128_Encryption_Standard

## Introduction

Advanced Encryption Standard (AES) is a symmetric encryption algorithm widely adopted for securing sensitive information. It supports key sizes of 128, 192, and 256 bits, with the 128-bit key variant being the most common. This documentation focuses specifically on AES encryption using a 128-bit key.

## Key Terms

1. **AES**: Advanced Encryption Standard, a widely used symmetric encryption algorithm.
2. **Block Cipher**: AES operates as a block cipher, encrypting data in fixed-size blocks (128 bits in the case of AES).
3. **Key Size**: The length of the key used for encryption (128 bits for AES-128).
4. **Block Size**: The size of the data block processed by the algorithm (128 bits for AES).
5. **Rounds**: The number of iterations in the encryption process. For AES-128, there are 10 rounds.

## Key Generation

The key generation process for AES-128 involves creating a key schedule from the original key. The key schedule is used to derive subkeys for each round of encryption.

### Key Schedule Generation

1. **Round Keys**: Break the original 128-bit key into 16-byte blocks.
2. **Key Expansion**: Generate a total of 10 round keys (one for each round) using a key expansion algorithm.

## Encryption Process

AES-128 encrypts data in fixed-size blocks (128 bits). The encryption process consists of multiple rounds, with each round applying a specific transformation to the data.

### Encryption Steps (for each 128-bit block)

1. **Initial Round**: AddRoundKey - XOR the block with the first round key.
2. **Rounds 1-9**: SubBytes, ShiftRows, MixColumns, AddRoundKey - Apply these transformations in sequence.
3. **Final Round**: SubBytes, ShiftRows, AddRoundKey - MixColumns is omitted in the last round.

### Transformation Details

1. **SubBytes**: Substitute each byte with a corresponding byte from the S-Box lookup table.
2. **ShiftRows**: Shift the rows of the block to the left by different offsets.
3. **MixColumns**: Combine and mix the columns of the block.
4. **AddRoundKey**: XOR the block with the current round key.

## Decryption Process

The decryption process is the reverse of encryption. It involves applying inverse transformations to the encrypted data using the round keys in reverse order.

### Decryption Steps (for each 128-bit block)

1. **Initial Round**: AddRoundKey (same as in encryption).
2. **Rounds 1-9**: InvMixColumns (inverse of MixColumns), InvShiftRows, InvSubBytes, AddRoundKey.
3. **Final Round**: InvShiftRows, InvSubBytes, AddRoundKey (MixColumns is omitted).

## Security Considerations

AES-128 is considered secure for a wide range of applications. However, the security depends on the strength of the key, and it's essential to use strong, unique keys for each encryption session.

## Conclusion

AES-128 provides a robust and efficient method for symmetric encryption. Understanding the key generation, encryption, and decryption processes is crucial for implementing secure communication and data protection. Always follow best practices for key management and stay informed about any developments in cryptographic research and technology.

**#Requirements**

Xilinux ISE project navigator or AMD Vivado

**#Contributing**

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or create a pull request.

**#Acknowledgments**

Thanks to the verilog programming community for valuable insights and support. Feel free to customize this README file based on the specific details of AES_128_Encryption_Standard project. Add information about additional features, dependencies, or any other relevant details.

###########################################################################################################


