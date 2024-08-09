﻿namespace Long.Network.Packets
{
    /// <summary>
    ///     Interface for packet encoding and decoding using TQ Digital Entertainment's byte
    ///     ordering rules. Called from the actor's send method to encode a packet without
    ///     needing to know the Client type for processing.
    /// </summary>
    public interface IPacket
    {
        public ushort Length { get; }
        public PacketType Type { get; }

        void Decode(byte[] bytes);
        byte[] Encode();
    }
}
