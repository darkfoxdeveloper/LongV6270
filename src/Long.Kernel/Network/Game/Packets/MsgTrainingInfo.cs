using Long.Network.Packets;

namespace Long.Kernel.Network.Game.Packets
{
    public sealed class MsgTrainingInfo : MsgBase<GameClient>
    {
        public ushort TimeUsed { get; set; }
        public ushort TimeRemaining { get; set; }
        public int Level { get; set; }
        public int Experience { get; set; }

        public override byte[] Encode()
        {
            using var writer = new PacketWriter();
            writer.Write((ushort)PacketType.MsgTrainingInfo);
            writer.Write(TimeUsed);
            writer.Write(TimeRemaining);
            writer.Write(Level);
            writer.Write(Experience);
            return writer.ToArray();
        }
    }
}