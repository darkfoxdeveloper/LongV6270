using Long.Database.Entities;
using Long.Kernel.States;
using Long.Kernel.States.Items;
using Long.Kernel.States.User;

namespace Long.Kernel.Scripting.Action
{
    public partial class GameAction
	{
		//TODO
		private static async Task<bool> ExecuteActionMountRacingEventResetAsync(DbAction action, string param, Character user,
																	 Role role, Item item, string[] inputs)
		{
			//HorseRacing horseRacing = EventManager.GetEvent<HorseRacing>();
			//if (horseRacing == null)
			//{
			//	logger.Fatal($"Cannot start horse racing! event not initialized");
			//	return false;
			//}

			//await horseRacing.PrepareStartupAsync(uint.Parse(param));
			return true;
		}
	}
}
