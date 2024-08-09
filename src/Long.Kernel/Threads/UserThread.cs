using Long.Kernel.Managers;
using Long.Shared.Threads;

namespace Long.Kernel.Threads
{
    public sealed class UserThread : ThreadBase
    {
        private readonly TimeOutMS basicProcessingTimer = new();

        public UserThread() 
            : base("User thread", 1000 / 60)
        {
            basicProcessingTimer.Startup(250);
        }

        protected override async Task OnProcessAsync()
        {
            bool nextProcessing = basicProcessingTimer.ToNextTime();
            foreach (var user in RoleManager.QueryUserSet())
            {
                if (nextProcessing)
                {
                    await user.OnTimerAsync();
                }
            }
        }
    }
}
