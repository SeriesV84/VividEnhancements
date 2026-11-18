# Vivid Enhancements | Dev Build v0.1

A premium Roblox executor script for **Rivals** featuring advanced aimbot, silent aim, ragebot, ESP, cosmetic unlocker, and more.

---

## Features

### Combat
| Module | Description |
|--------|-------------|
| **Aimbot** | Camera-based aim assist with target lock, multiple modes (Lock/Linear/Spring/AI) |
| **Silent Aim** | Projectile redirection without camera movement, hitbox selection, FOV |
| **Ragebot** | Aggressive targeting, weapon priority, evasive movement, anti-aim resolver |
| **Fire Assist** | Automatic firing, flickbot, triggerbot integration |
| **Weapon Handling** | Aim, firing, cooldown, melee, grenade behavior customization |
| **Hit Feedback** | Sound, visual, flash, notification feedback |

### Ragebot v2 (New in v0.1)
| Feature | Description |
|---------|-------------|
| **Anti-Aim Resolver** | Pattern detection: Jitter, Spin, Static, Backwards, LBY-break with miss correction |
| **Backtrack** | 128-tick history buffer, latency-compensated rewind |
| **Projectile Prediction** | Gravity + velocity extrapolation for Slingshot, Throwing Knife, Grenade, Snowball |
| **Multi-Point Hitbox** | 5-point sampling per hitbox (center + corners) with visibility verification |
| **Dynamic FOV** | Weapon/distance/lock-state adaptive radius (50-300) |
| **Perlin Noise Evasion** | Organic 3D Perlin noise movement (3 octaves, configurable) |
| **Triggerbot Integration** | Humanized reaction time (30-80ms), burst control |
| **Debug Visuals** | FOV circle, target line, hitbox wireframes, backtrack dots, resolver state |

### Evasion Modes
- **Off** — No evasion
- **Random** — Sphere jitter around origin
- **Translocate** — Crouch desync with vertical offset
- **Projectile Breaker** — Environment scanning for cover behind `RaycastWhitelist` parts
- **Perlin Noise** — Organic 3D noise-based movement

### Visuals (ESP)
- **Enemy/Team**: Box, Filled Box, Health Bar, Health Number, Distance, Rank, Winstreak, Deflecting, Chams, Skeleton, Head Marker, Tracer
- **Customization**: Font, size, colors, animations (Shimmer/Perimeter/PingPong), distance scaling
- **Sound ESP**: Footsteps & other sounds with circle/origin visualization
- **Rank Spoof**: Custom rank text & icon

### Cosmetics Unlocker
- **Skins** — Weapon skins with shimmer/perimeter/ping-pong animations
- **Wraps** — Weapon wraps
- **Charms** — Weapon charms
- **Dances** — Emote dances
- **Emotes** — Standard emotes
- **Favorites System** — Per-item favorite/reroll
- **Config Persistence** — JSON-based (`vividenhancements/rivals_v3`)

### Movement
- WalkSpeed, JumpPower, Flight, Sliding, Noclip, AutoStrafe, LongJump
- Movement Recorder (record/replay with look alignment)
- Third Person, Camera FOV, Stretched Resolution

### Removables
- No Flashbang, No Burn Effect, No ADS Vignette, No Scope Overlay/Reticle
- No Gun Tracers, No Muzzle Flash, No Hitmarker

### Player Spoofer
- **LocalPlayer**: Name, DisplayName, Avatar, Ping, Keys, EventCurrency, Winstreak, Level, Casual/Ranked Wins, Win%, Elo, Leaderboard Rank, Favorite Map, Nametag Status, Influencer, RobloxEmployee, NosniyTeam
- **Other Players**: Same fields (targeted)

### Device Spoof
- VR spoofing

### Animation Player
- Custom animation playback (Cat Girl Bounce + custom IDs)

### Theme & Notifications
- Full color token theming (Accent, Outline, Background, ElementBackground, TabButtonSelected, Unselected, TextColor, ToggleCircle/Background)
- Notification positioning, size, font

---

## Installation

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/SeriesV84/VividEnhancements/main/VividEnhancements.lua"))()
```

**Requirements:**
- Roblox executor with `loadstring` support (Delta iOS, Fluxus, Arceus X, etc.)
- `hookfunction`, `hookmetamethod`, `getrawmetatable`, `newcclosure`, `setthreadidentity`, `getrenv`, `debug.traceback`, `getgc`, `cloneref` (or safe fallbacks provided)

---

## Configuration

Configs saved to:
- `vividenhancements/rivals` — General state
- `vividenhancements/rivals_v3` — Cosmetic unlocker data
- `rivals_unlocker_config.json` — Legacy unlocker config

Auto-load last config on execution.

---

## Ragebot Config Structure

```lua
Ragebot = {
    Enabled = false,
    Keybind = { State = false, Kind = "Always" },
    Stability = 0.15,
    ShootFrames = 1,
    PrioritizeHackers = false,
    
    Weapons = {
        Priority = { "Primary", "Secondary", "Melee" },
        Enabled = { Primary = true, Secondary = true, Melee = true },
        OnEmpty = "SwapOrReload",
    },
    
    Evasion = {
        Mode = "Random", -- Off | Random | Translocate | ProjectileBreaker | PerlinNoise
        Random = { AnchorFromCharacter = false, BaseRadius = 100, RadiusRandomFactor = 0.5 },
        ProjectileBreaker = {
            DepthForward = { Min = 0, Max = 4 },
            DepthForwardFrequency = 5,
            DepthUp = { Min = 0, Max = 5.5 },
            DepthUpFrequency = 5,
            RepositionInterval = 0.3,
            FallbackAnchorFromCharacter = false,
            FallbackBaseRadius = 100,
            FallbackRadiusRandomFactor = 0.5,
        },
        Translocate = { Offset = -5 },
        PerlinNoise = { Enabled = true, Octaves = 3, Frequency = 0.1, Amplitude = 15 },
    },
    
    Resolver = {
        Enabled = true,
        HistoryTicks = 128,
        Patterns = { "Jitter", "Spin", "Static", "Backwards", "LBY" },
        MissCorrection = true,
        LatencyCompensation = 0.1,
    },
    
    Backtrack = {
        Enabled = true,
        MaxTicks = 128,
        Visualize = false,
    },
    
    Prediction = {
        Projectile = true,
        Gravity = workspace.Gravity,
        VelocityExtrapolation = true,
    },
    
    HitboxSelection = {
        Mode = "Adaptive", -- ClosestToCrosshair | WeightedRandom | DamagePriority | VisibilityCheck | MultiPoint | Adaptive
        MultiPoint = { Enabled = true, PointsPerHitbox = 5, SizeReductionPercentage = 50 },
        VisibilityCheck = { Enabled = true },
        DamageWeights = { Head = 1.0, Body = 0.6, Limbs = 0.3 },
    },
    
    FOV = {
        Dynamic = {
            Enabled = true,
            MinRadius = 50,
            MaxRadius = 300,
            WeaponScale = {
                Sniper = 0.5, Rifle = 1.0, Shotgun = 1.5,
                Pistol = 1.2, SMG = 1.3, LMG = 0.9, Melee = 2.0,
            },
        },
    },
    
    Triggerbot = {
        Integrated = true,
        ReactionTime = { Min = 30, Max = 80 },
        BurstLimit = 3,
    },
    
    Debug = {
        Enabled = false,
        ShowFOV = true,
        ShowTargetLine = true,
        ShowHitboxes = true,
        ShowBacktrack = true,
        ShowPrediction = true,
        ShowEvasionPath = true,
        ShowResolverState = true,
    },
    
    UtilizeHealthLead = false,
}
```

---

## Changelog

### v0.1 — Dev Build (2026-11-18)
- **Complete rebrand** from KiciaHook → Vivid Enhancements
- **Ragebot v2** — Full rewrite with:
  - Anti-aim resolver (Jitter/Spin/Static/Backwards/LBY + miss correction)
  - 128-tick backtrack with visualization
  - Projectile prediction (gravity + velocity)
  - Multi-point hitbox selection (5 points/hitbox)
  - Visibility-verified targeting
  - Dynamic FOV (weapon/distance/lock adaptive)
  - Perlin noise organic evasion (3 octaves)
  - Triggerbot integration (humanized reaction + burst)
  - Debug visuals (FOV, hitboxes, backtrack, resolver state)
- **Cosmetic Unlocker** — Fixed stacking issues (Accretion Stack, Alpha Coin Stack)
- **AC Bypass** — CameraSecurity, thread identity, RemoteEvent hooks
- **Delta iOS Compatibility** — PlayerGui fallback, touch handling, responsive UI
- **Auto-push** — GitHub sync every 5s via `auto-push.sh`

---

## Credits

- **Original KiciaHook Premium** — Base framework
- **Open source Roblox executor community** — Hooking patterns, bypass techniques
- **SeriesV84** — Vivid Enhancements branding, integration, UI

---

## Disclaimer

This software is for **educational and research purposes only**. Use at your own risk. The authors are not responsible for any account actions taken by Roblox or game moderators.

---

**Vivid Enhancements | Dev Build** — Built different. 6767, gng.