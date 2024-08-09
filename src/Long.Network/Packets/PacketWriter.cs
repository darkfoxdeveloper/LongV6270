﻿using System.Text;

namespace Long.Network.Packets
{
    /// <summary>
    ///     Writer that implements methods for writing bytes to a binary stream writer, used
    ///     to help encode packet structures using TQ Digital's byte ordering rules. Packets
    ///     sent using the <see cref="TcpServerActor" />'s send method do not need to be
    ///     written with a prefixed length. The send method will include this with the final
    ///     result of the packet writer.
    /// </summary>
    public sealed class PacketWriter : BinaryWriter, IDisposable
    {
        private static readonly Encoding CurrentEncoding = CodePagesEncodingProvider.Instance.GetEncoding(1252);

        /// <summary>
        ///     Instantiates a new instance of <see cref="PacketWriter" /> and writes the
        ///     first unsigned short to the stream as a placeholder for the packet length.
        /// </summary>
        public PacketWriter() : base(new MemoryStream(), CurrentEncoding)
        {
            base.Write((ushort)0);
        }

        /// <summary>
        ///     Writes a string to the current stream. The string is fixed with a known
        ///     string length before writing the string value encoded as an ASCII string
        ///     to the stream.
        /// </summary>
        /// <param name="value">String value to be written to the stream</param>
        /// <param name="fixedLength">Length of the string to be written</param>
        public void Write(string value, int fixedLength)
        {
            var array = new byte[fixedLength];
            CurrentEncoding.GetBytes(value).CopyTo(array, 0);
            base.Write(array);
        }

        /// <summary>
        ///     Writes a string to the current stream. The string is prefixed with the byte
        ///     length and encoded as an ASCII string.
        /// </summary>
        /// <param name="value">String value to be written to the stream</param>
        public override void Write(string value)
        {
            Write((byte)value.Length);
            if (value.Length > 0)
            {
                Write(value, value.Length);
            }
        }

        /// <summary>
        ///     Writes a list of strings to the current stream. The string list is prefixed with
        ///     the amount of strings in the list. Then, each string in the list is prefixed
        ///     with the length of that string and encoded as an ASCII string.
        /// </summary>
        /// <param name="strings">List of strings to be written to the stream</param>
        public void Write(List<string> strings)
        {
            base.Write((byte)strings.Count);
            for (var i = 0; i < strings.Count; i++)
            {
                Write(strings[i]);
            }
        }

        /// <summary>
        ///     Writes the packet writer's stream to a byte array, regardless of the position
        ///     of the stream. Flushes all writes to the stream before returning an array.
        /// </summary>
        /// <returns>Returns the byte array representation of the memory stream.</returns>
        public byte[] ToArray()
        {
            BaseStream.Flush();
            return (BaseStream as MemoryStream).ToArray();
        }

        #region IDisposable Support

        private bool DisposedValue; // To detect redundant calls

        /// <summary>
        ///     Called from the Dispose method to dispose of class resources once and only
        ///     once using the Disposable design pattern. Calls into the base dispose method
        ///     after disposing of class resources first.
        /// </summary>
        /// <param name="disposing">True if clearing unmanaged and managed resources</param>
        private new void Dispose(bool disposing)
        {
            if (!DisposedValue)
            {
                if (disposing)
                {
                    BaseStream.Close();
                    BaseStream.Dispose();
                }

                base.Dispose(disposing);
                DisposedValue = true;
            }
        }

        /// <summary>
        ///     Called to dispose the class.
        /// </summary>
        public new void Dispose()
        {
            Dispose(true);
        }

        #endregion
    }
}
