﻿using Long.Kernel.Modules.Interfaces;
using Long.Kernel.Network.Game;
using Long.Module.Pigeon.Network;
using Long.Network.Packets;

namespace Long.Module.Pigeon
{
    public sealed class NetworkMessageHandler : INetworkMessageHandler
    {
        public Task<bool> OnReceiveAsync(GameClient actor, PacketType type, byte[] message)
        {
            MsgBase<GameClient> msg;
            if (type == PacketType.MsgPigeon)
            {
                msg = new MsgPigeon();
            }
            else
            {
                return Task.FromResult(false);
            }

            if (actor?.Character?.Map == null)
            {
                return Task.FromResult(true);
            }

            msg.Decode(message);
            actor.Character.QueueAction(() => msg.ProcessAsync(actor));
            return Task.FromResult(true);
        }
    }
}
