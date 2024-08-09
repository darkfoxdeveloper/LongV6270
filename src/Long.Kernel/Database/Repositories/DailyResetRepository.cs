using Long.Database.Entities;

namespace Long.Kernel.Database.Repositories
{
    public static class DailyResetRepository
    {
        public static DbDailyReset GetLatest()
        {
            using var ctx = new ServerDbContext();
            return ctx.DailyResets.OrderByDescending(x => x.Id).FirstOrDefault();
        }
    }
}
