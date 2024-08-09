using System.Drawing;

namespace Long.Kernel.States.Magics
{
    public partial class MagicData
    {
        private ushort useMagicType;

        private Point targetPos;
        private uint idTarget;

        private bool autoAttack;
        private int autoAttackCount;

        private readonly TimeOutMS delayTimer = new(MAGIC_DELAY);
        private readonly TimeOutMS intoneTimer = new();
        private readonly TimeOutMS magicDelayTimer = new(MAGIC_DELAY);
    }
}
