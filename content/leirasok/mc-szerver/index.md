---
title: Minecraft Java Szerver Készítés Windows-on
date: 2023-06-07T16:13:22.936Z
draft: false
author: Xelofan
categories:
  - minecraft
  - windows
  - youtube
  - játékok
keywords: imswat minecraft szerver készítés tutorial java edition youtube videó gyorsan röviden tömören gamer
description: "Kiegészítő leírás az ugyan ezen a néven megtalálható YouTube videónkhoz."
---

Az alábbi leírás egy kiegészítő a YouTube-on található videónkhoz, de önmagában is hasznos lehet:
{{< youtube Fj_5VhWkhtg >}}
🎥 [Videó](https://youtu.be/Fj_5VhWkhtg)

### Tartalom
- [Java verziók](#{{< anchorize "Java verziók" >}})
- [Szerverfájl letöltése](#{{< anchorize "Szerverfájl letöltése" >}})
  - [Mi a különbség köztük ?](#{{< anchorize "Mi a különbség köztük ?" >}})
  - [Melyiket válaszd, ha nem tudsz dönteni](#{{< anchorize "Melyiket válaszd, ha nem tudsz dönteni" >}})
- [Indítófájl létrehozása](#{{< anchorize "Indítófájl létrehozása" >}})
  - [Magyarázat](#{{< anchorize "Magyarázat" >}})
  - [eula.txt](#{{< anchorize "eula.txt" >}})
- [A szerver elindítása](#{{< anchorize "A szerver elindítása" >}})
- [Zárás](#{{< anchorize "Zárás" >}})


## Java verziók
Feltételezem, hogy ha Minecraft szervert szeretnél futtatni, már van megfelelő Java verzió a gépeden, de ha nincs, az alábbi táblázat, ami egyébként a [**Paper** szerverekhez lett készítve](https://docs.papermc.io/paper/getting-started), segítséget adhat a megfelelő verzió használatához:

| Verzió | Ajánlott Java verzió |
| :---: | :---: |
| 1.8 - 1.11  | Java 8 |
| 1.12 - 1.16.4  | Java 11 |
| 1.16.5 | Java 16 |
| 1.17.1 - 1.19.4+  | Java 17 |

## Szerverfájl letöltése
Ahhoz, hogy elkezdhessük a Minecraft szerverünk futtatását, szükségünk lesz egy **.jar** szerverfájlra, ami lehet:
- [**Vanilla**](https://www.minecraft.net/en-us/download/server) *(sima, [minecraft.net](https://www.minecraft.net/en-us/download/server)-ről letöltött)*,
- [**CraftBukkit**](https://www.spigotmc.org/wiki/buildtools/),
- [**Spigot**](https://www.spigotmc.org/wiki/buildtools/),
- [**Paper**](https://papermc.io/downloads/paper),
- [**Purpur**](https://purpurmc.org/),
- vagy bármi más amit most nem soroltam fel.

Természetesen van még rengeteg más lehetőség, például **Forge** és **Fabric** modolt játékhoz, vagy **BungeeCord** és **Waterfall** több szerver összekötéséhez, de ezt a leírást egy sima mezei szerver futtatására készítettem.

### Mi a különbség köztük ?

- **Vanilla**: A hivatalos szerverfájl, amit a [minecraft.net](https://www.minecraft.net/en-us/download/server)-ről lehet letölteni. Semmilyen módosítást nem tartalmaz.
- **CraftBukkit**: Az első módosított szerver, ami képes pluginokat futtatni, de kevésbé optimalizált. Ahhoz hogy legálisan lehessen használni, a [**SpigotMC BuildTools**](https://www.spigotmc.org/wiki/buildtools/)-ra lesz szükség a .jar fájl legenerálásához.
- **Spigot**: A legnépszerűbb szerver, a **CraftBukkit** egy forkja, ami több száz javítást és optimalizációt tartalmaz. Ahhoz hogy legálisan lehessen használni, a [**SpigotMC BuildTools**](https://www.spigotmc.org/wiki/buildtools/)-ra lesz szükség a .jar fájl legenerálásához.
- **Paper**: Ez is az egyik legnépszerűbb szerver, a **Spigot** egy forkja. 200+ patchet tartalmaz és rengeteg játékmenettel kapcsolatos beállítás konfigurálható. Remek alternatíva a **Spigot**ra, ha nem szeretnénk **BuildTools**-zal foglalkozni.
- **Purpur**: A **Paper** egy forkja. A **Paper** rengeteg állítható beállításai mellé plusz beállításokat, hibajavításokat és optimalizációkat ad.

```goat
   .---------.          .-------------.  fork   .--------.  fork  .-------.  fork  .--------.
   | Vanilla |          | CraftBukkit | +---->  | Spigot | +----> | Paper | +----> | Purpur |
   .---------.          .-------------.         .--------.        .-------.        .--------.
```

### Melyiket válaszd, ha nem tudsz dönteni

Ha nem tudod, hogy melyiket válaszd, akkor a **Paper**t ajánlanám, hiszen nem lesz instabil a játékmenet a rengeteg optimalizációnak köszönhetően, ellentétben a **Vanilla**-val. Azért nem **Purpur**t, mert nem mindig érhető el belőle frissítés egyből, ha kijön egy újabb verzió, és a sok beállítás zavaró lehet kezdő Minecraft szerver futtatóknak, de egyébként én ezt szoktam használni.

A videóban **Paper**t használtam, hiszen a rengeteg hibajavításnak és optimalizációnak köszönhetően stabil játékmenetet nyújt.

## Indítófájl létrehozása
Azután, hogy eldöntöttük melyik szervert fogjuk használni, hozzunk neki létre egy mappát.

Ahhoz, hogy el tudjuk indítani a szervert, szükségünk lesz egy indítófájlra, aminek bármilyen nevet adhatunk, de **ami fontos, hogy .bat-ra végződjön**.

A legkönnyebben úgy tudjuk ezt a fájlt létrehozni, hogy nyitunk egy Jegyzettömböt, majd az alábbi parancsot belemásoljuk:

```batch
java -Xms1G -Xmx3G -jar paper.jar --nogui
PAUSE
```
Módosítsd a RAM beállításokat, hogy a rendszerednek megfelelően legyen beállítva [*(segítség alább)*](#magyarázat) és a .jar fájlod nevét, ha más.  
{{< figure src="notepad-save-as.png" >}}
{{< figure src="save.png" >}}

Miután ezzel megvagyunk, nyomjunk bal fent a **Fájl**ra, **Mentés másként**, keressük meg a mappát ahol van a .jar fájl és mentsük el oda.

Mentésnél bármilyen nevet megadhatunk, de ügyenjünk a **.bat végződésre**. Én az egyszerűség kedvéért **start.bat**-nak neveztem el.

### Magyarázat
- **java**: Meghívjuk a Java-t.
- **-Xms**: Minimum RAM. *(pl.: 3GiB RAM-nál -Xms3G, vagy 1500MiB RAM-nál -Xms1500M)*
- **-Xmx**: Maximum RAM. *(pl.: 3GiB RAM-nál -Xmx3G, vagy 1500MiB RAM-nál -Xmx1500M)* **Soha ne add meg neki a rendszer összes memóriáját, kb. 1500MiB RAM-ot mindig hagyj szabadon!**
- **-jar paper.jar**: Megadjuk, hogy melyik fájlt szeretnénk használni.
- **--nogui**: Eltüntetjük az amúgy megjelentő fehér konzol ablakot, ami zavaró lehet, mert ilyenkor 2 ablak van megnyitva. ***Nem kötelező***
- **PAUSE**: Ha leáll/crashel a szerver ne tűnjön el a konzol, hibakereséshez tökéletes. ***Nem kötelező***

### eula.txt
Még nem végeztünk, hiszen hátravan az utolsó lépés, az **eula.txt** fájl létrehozása. Ez azért szükséges, mert enélkül nem fog elindulni a Minecraft szerverünk. Azzal, hogy létrehozzuk ezt a fájlt, elfogadjuk a [**Minecraft EULA**](https://www.minecraft.net/en-us/eula)-t *(Minecraft Felhasználói Licencszerződés)*.

*Ha már elindítottad a szervert, de leállt azzal az indokkal, hogy nincs elfogadva az EULA, elég megnyitni a fájlt és átírni a **false**-t **true**-ra.*

A fájl elkészítése rendkívül egyszerű, mindössze a következő sort kell bemásolnunk egy **eula.txt** fájlba:
```txt
eula=true
```

## A szerver elindítása

Most, hogy mindennel megvagyunk, elindíthatjuk a Minecraft szervert. **Mindössze annyit kell tennünk, hogy elindítjuk a start.bat fájlt** *(vagy aminek el lett nevezve)*. Ezzel megnyílik a szerver konzol és OP-t adhatunk magunknak, ha szeretnénk.

{{< figure src="console.png" title="A képen adtam magamnak OP-t, az \"op név\" paranccsal." >}}

## Zárás
Ha valami problémába ütköztél, vagy szeretnéd, hogy kiegészítsük még valamivel ezt a leírást, hagyj egy kommentet az [ehhez kapcsolódó videónk](https://youtu.be/Fj_5VhWkhtg) alatt!
