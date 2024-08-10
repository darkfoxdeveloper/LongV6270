using Long.Kernel.Modules.Interfaces;
using Long.Kernel.Network.Game;
using Long.Module.TaskDetail.Network;
using Long.Network.Packets;

namespace Long.Module.TaskDetail
{
    public sealed class NetworkMessageHandler : INetworkMessageHandler
    {
        public async Task<bool> OnReceiveAsync(GameClient actor, PacketType type, byte[] message)
        {
            MsgBase<GameClient> msg = null;
            if (type == PacketType.MsgTaskStatus)
            {
                msg = new MsgTaskStatus();
            }
            else if (type == PacketType.MsgTaskDetailInfo)
            {
                msg = new MsgTaskDetailInfo();
            }
            else if (type == PacketType.MsgTaskDialog)
            {
                var d = new Kernel.Network.Game.Packets.MsgTaskDialog();
                d.Decode(message);
                if (d.TaskIdentity > 0)
                {
                    var idTaskTmp = d.TaskIdentity.ToString().Substring(1).TrimStart('0');
                    uint idTask = uint.Parse(idTaskTmp);
                    msg = new MsgTaskStatus();
                    (msg as MsgTaskStatus).QuitQuest(idTask);
                    await msg.ProcessAsync(actor);
                }
                return false;
            }
            else
            {
                return false;
            }

            if (actor?.Character?.Map == null)
            {
                return true;
            }

            msg.Decode(message);
            actor.Character.QueueAction(() => msg.ProcessAsync(actor));
            return true;
        }
    }
}
