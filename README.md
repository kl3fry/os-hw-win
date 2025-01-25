# Windows 10 instalācija
##### Autors: Arvīds Bākulis
##### Studenta apliecības nummurs: ab24166

## Ievads

Šajā darbā es instalēšu **Windows 10** un konfigurēšu to.

Markdown avota failus, konfigurācijas failus un visu pārējo varēs atrast darba [Github repozitorijā](https://github.com/kl3fry/os-hw-win/)

### Kāpēc tieši Windows 10?

- 10 ir vēl lietojama mūsdienu scenārijos.
- Satur mazāk (bet vienalga daudz) spiegprogrammatūras un lietotāja brīvību ierobežojošo "inovāciju", kas satiekamas Windows 11.

### Sistēma instalācijai:

- **QEMU/KVM** virtuālā mašīna ar **libvirt** un **VirtManager** frontend-u.
    - Virtuālai mašīnai tiks atvēlēta sava fiziskā grafikas karte **RX 6700 XT***.
    - Video kartei ir pieslēgts savs monitors tāpēc tāds būs ari virtuālai mašīnai. 
    - Perefērijas ierīces (pele, klaviatūra) virtuālai mašīnai pieslēgtas kā **evdev** ierīces lai tās viegli varētu pārslēgt starp **host**** un **guest**** sistēmām.

###### * Vairāk par GPU passthrough: https://wiki.archlinux.org/title/PCI_passthrough_via_OVMF https://wiki.archlinux.org/title/QEMU/Guest_graphics_acceleration
###### ** host - fiziskās mašīnas instalētā sistēma; guest - virtuālā mašīnā instalētā sistēma

### Par instalāciju:

- Instalēšu **Windows 10** un konfigurēšu to tā, ja man pašam nāktos to izmantot (nedod dievs)
- Izdzēsīšu un/vai izslēgšu vismaz daļu no Microsoft iepriekš instalētās spiegprogrammatūras
- Instalēšu nepieciešamos draiverus
- Instalēšu visas nepieciešamās un vēlamās programmas
- Instalēšu un pārādīšu kādu spēli

## Virtuālās mašīnas konfigurācija un izveide

- Lejupielādēju instalācijas vides `.iso` attēlu no oficiālās mājaslapas:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/host/win10site.png)

- Lejupielādēju **Windows 10 English International** un varu sākt izveidot virtuālo mašīnu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/host/vm-iso.png)

- Atvēlu tai **8GB** atmiņas, un **128GB** krātuves kā arī visus savus procesora kodolus:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/host/vm-ram.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/host/vm-drive.png)

- Katram gadījumam uzstādu precīzu CPU topoloģiju:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/host/vm-top.png)

- Pievienoju host failu sistēmas caurlaidi lai starp host un guest sistēmām viegli pārvietot failus:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/host/vm-fs.png)

- Failu sistēmas caurlaidei ir nepiecišams ieslēgt `shared memory`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/host/vm-ram2.png)

- Kā arī pievinoju tai host klaviatūru un peli kā `evdev` ierīces iai tās varētu viegli pārslēgt starp host un guest sistēmām (strādā ka virtuāls KVM slēdzis):

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/host/vm-evdev.png)

- Tagad var spiest `Begin Installation` sākt instalāciju!

## Instalācija

- Nedaudz pagaidu un instalācijas vide ir ielādējusies:

- `Time and currency format` izvēlnē izvēlos `English (World)`, jo tad sistēmā būs mazāk reklāmas. Un spiežu `Next`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/start.png)

- Šajā logā spiežu `I don't have a product key`, jo Microsoft tā pat nopelnīs vairāk nekā pietiekams, pārdodot un izmantojot manu un citu cilvēku informāciju 🙃:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/key.png)

- Versiju izvēlē izvēlos `Windows 10 Pro`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/version.png)

- Ļoti rūpīgi izlasu licences noteikumus un spiežu `I accept the licence terms`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/eula.png)

- Instalācijas tipa izvēlnē izvēlos `Custom`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/install-type.png)

- Diska sadalīšanā neko nemainu un vienkārši spiežu `Next`, jo disks ir tīrs un citas sadaļas man nav vajadzīgas:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/partition.png)

- Tagad gaidu kamēr sistēma instalējas:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/wait.png)

- Nedaudz pagaidu, virtuālā māšīna pārstartējas, un tagad man dod izvēlēties reģionu. Izvēlos Latviju:
/
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/region.png)

- Kā klaviatūras izkārtojumu izvēlos `US`, pārējo pievienošu vēlāk:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/layout.png)

- Izvēlnē ar papildus izkārtojumiem spiežu `Skip` un tagad atkal nedaduz pagaidu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/wait2.png)

- Izvēlos iestatīt sistēmu kā personālo:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/personal.png)

- Nākamajā logā izvēlos `Offline account` lai nesaistītu šo instālāciju ar online Microsoft kontu. Šāda iespēja nav tik viegli pieejama Windows 11:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/account.png)

- Microsoft negrib lai es tik viegli atsakos no viņu konta, bet es atkal spiežu `Limited experience`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/account2.png)

- Ievadu sava lietotāja vārdu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/user.png)

- Izveidoju lietotājam ļoti drošu paroli no 3 cipariem un atkārtoju to:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/pass.png)

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/pass2.png)

- Ar trim cipariem atbildu arī uz 3 jautājumiem, kurus man jautās ja tos 3 ciparus aizmirsīšu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/questions.png)

- Naivie Microsoft domā ka es izmantošu viņu pārlūku un piedāvā man importēt savus datus. Atsakos:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/edge-import.png)

- Tagad Microsoft prasa atļauju mani izspiegot. Atsakos no visiem, bet, protams, viņi to tāpat darīs 🙃:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/spy.png)

- Te man prasa kam es lietošu šo sistēmu lai savāk vēl vairāk infromācijas par mani un, kā tur teikts, dot man "personalizētus padomus, reklāmas un ieteikumus". Es pats tikšu galā, padomi man nav vajadzīgi, tāpēc vienkārši spiežu `Skip`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/what.png)

- Vēl nedaudz pagaidu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/hi.png)

- Un sistēma ir instalēta:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/install/fin.png)

## Programu instalēšana un sistēmas konfigurēšana

### Sākumam instalēšu **WinFSP** un **virtio-win** dravierus lai failu sistēmas caurlaide strādātu un būtu iespēja tai piekļūt no guest sistēmas.

- Lejupielādēju **WinFSP** instalētāju un instalēju to:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/winfsp-web.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/winfsp-web2.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/winfsp-inst.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/winfsp-inst2.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/winfsp-inst-fin.png)

- Un lejupielādēju **virtio-win** instalētāju no github lapas un instalēju to:

- Edge pārlūkam nepatīk draivera fails, tāpēc spiežu `Keep`: 

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/virtio-github-keep.png)

- Vēljoprojām nepatīk, tāpēc atkal spiežu `Keep anyway`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/virtio-github-keep2.png)

- Tagad **SmartScreen** sāk sūdzēties... Spiežu `More info` un pēc tam `Run anyway`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/virtio-install-not-so-smart-screen.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/virtio-install-not-so-smart-screen2.png)

> Starp citu ir ļoti forši ka operētājsistēma neklausa lietotāju un nedod man uzreiz izdarīt ko es gribu 🙃. 

- Beidzot instalācija ir sākusies:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/virtio-win-inst.png)

- Nekur neko nemainu un vienkārši spiežu `Next`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/virtio-win-inst2.png)

- Un instalēcija ir beigusies:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/virtio-win-inst3.png)

- Tagad ir jāieslēdz `VirtIO-FS Service` serviss. Priekš tam atveru **Services** un atrodu nepieciešamo:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/virtio-fs-service.png)

- Spiežu tam virsū un atvērtajā logā nomainu `Startup type` uz `Automatic` lai serviss startētu kopā ar sistēmu un piespiežu `Start` lai to uzreiz ieslēgt nepārstartējot mašīnu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/virtio-fs-service2.png)

- Atveru vaļā failu pārlūku un redzu, ka caurlaistā failu sistēma ir pieejama:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/fs/virtio-fin.png)

### Tagad pārstartēšu virtuālo mašīnu, pieslēdzot tai fizisko video karti.

- Pieslēdzu karti virtuālai mašīnai:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/host/passthrough.png)

- Startēju mašīnu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/passthrough/passthrough-start.png)

- Un kamēr es pievienoju iepriekšējo attēlu darbam Windows atrada draiverus manai kartei:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/passthrough/passthrough-found.png)

### Tagad nedaudz konfigurēšu sistēmu un to izskatu.

- Vispirms izdzēšu nevajadzīgās saitnes no darbvirsmas un uzdevumu joslas, bet izrādās, ka `Learn about this picture` pat nevar izdzēst... Tāpēc to izlaižu (Arī Teams pogai piespiežu ar labo peles pogu un izvēlos `Hide` lai to slēptu, bet to izdarīju vēlāk):

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/clean.png)

- Tālāk es dodos iestatījumos lai konfigurēt uzdevumu joslu, bet izrādās, ka Microsoft grib lai es tiem vispirms samaksātu... Tadu plānu man nav tāpēc pagaidām šo izlaižu 🙃:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/greedy.png)

- Tajā vietā uzlieku foršu fona attēlu uzpiežot uz to ar labo peles pogu un izvēloties `Set as desktop background`. Kaitinošā ikona, starp citu, pazuda:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/bg.png)

### Chris Titus Tech's Windows Utility

Eksistē tāda jauka utilīta, kas piedāvā dažādus sīkākus uzlabojumus, liekās un spiegošanas programmatūras izdzēsšanu priekš svaigām Windows instalācijām.

Pēc autora vārdiem (mašīntulkošana):

> Šī utilīta ir Windows uzdevumu apkopojums, ko veicu katrā izmantotajā Windows sistēmā. Tas ir paredzēts, lai racionalizētu instalēšanu, veiktu uzlabojumus, novērstu problēmas ar konfigurāciju un labotu Windows atjauninājumus...

Es to izmantošu šajā instalācijā.

To Github lapu var apskatīties [šeit](https://github.com/ChrisTitusTech/winutil)

- Lai startētu šo programmu **Powershell** terminālī ir jāieraksta sekojošā komanda:
    - `irm "https://christitus.com/win" | iex`

- Sākumā atveru **Powershell** ar administrātora tiesībām:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/winutil-shell.png)

- Ievadu iepriekš minēto komandu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/winutil-shell-enter.png)

- Nedaudz pagaidu un atveras šāds logs:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/winutil.png)

- Sākšu ar `Tweaks` sadaļu. Tajā izvēlos šadus parametrus un spiežu `Run Tweaks`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/winutil-tweaks.png)

- Pastāstīšu par galveniem no tiem:
- Atjauninājumi
- Demonstrēt programmu - rezidentu sarakstu.
- Palaist diska defragmentāciju vai optimizāciju.
- Pievienot Windows vismaz 2 valodas : latviešu un vēl kādu citu. Uzrakstīt kaut kādu īsu tekstu, lietojot 3 valodas.
- Demonstrēt, ka visi draiveri ir uzinstalēti. Parādīt logu ar aparatūras sarakstu.
- Startēt OS Windows “Safe mode” režīmā.
- Mainīt “Pagefile” konfigurāciju. Atslēgt to, vai uztaisīt lielāku. 

    - ``Delete Temporary Files`` - džēš pagaidu failus
    - ``Disable Telemetry`` - izslēdz daudzas spiegošanas funkcijas
    - ``Disable Location Tracking`` - izslēdz atrašanās vietas izsekošana
    - ``Enable End Task With Right Click`` - uzkilksšinot ar labo peles pogu uz kādu programmu uzdevumu joslā būs iespēja beigt tā procesu
    - ``Set Services to Manual`` - izslēdz daudzus bezjēdzīgi ieslēgtus servisus
    - ``Remove Microsoft Edge`` - izdzēš **Edge** pārlūku
    - ``Remove OneDrive`` - izdēš OneDrive integrāciju
    - ``Show Hidden Files`` - padara slēpros failus redzamus
    - ``Show File Extensions`` - padara faila paplašinājumus redzamus
    - ``Dark Theme for Windows`` - ieslēdz tumšo interfeisu

- Neaizmirstu piespiezt `Run OO Shutup 10` - programma kas sniedz vēl vairāk sīku uzlabojumu un ļauj izdzēst/izslēgt vēl vairāk telemetrijas un spiegošanas programmatūras:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/oo.png)

- Lai būtu vienkāršāk un pašam nav jāizvēlas parametri - `Actions` sadaļā spiežu `Apply only recommended settings` lai pielietotu tikai rekomendētos iestatījumus.

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/oo-rec.png)

- Gatavs:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/oo-fin.png)

- Tagad aizveru **OO Shutup 10** un pāreju **winutil** `Install` sadaļā. Šeit izvēlos tikai `LibreWolf`, jo Edge es izvēlējos izdzēst un man ir vajadzīgs pārlūks, pārējo instalēšu pats. Spiežu `Install/Upgrade Selected`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/winutil-install.png)

- Nedaudz pagaidu un ir gatavs:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/winutil-install-fin.png)

### Nedaudz gribu pateikt par pārlūkprogrammu, ko tikko instalēju - LibreWolf.

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/LibreWolf_icon.svg)

**LibreWolf** ir mans mīļākais pārluks ko es pats katru dienu lietoju kā galveno visās savās sistēmās. Tas ir privātumam veltīts, balstīts uz Mozilla Firefox un izveidots, lai nodrošinātu drošāku un privātāku pārlūkošanu, noņemot telemetriju un iekļaujot privātuma uzlabošanas funkcijas pēc noklusējuma.

#### Galvenie aspekti:

- **LibreWolf** noņem Firefox telemetriju, tāpēc tas nesūta datus atpakaļ uz Mozilla vai citām trešajām pusēm.
- Izslēdz funkcijas, kas var apdraudēt lietotāja privātumu, piemēram, WebRTC (lai novērstu IP noplūdes).
- Iekļauj **uBlock Origin** kā reklāmas un tās telemetrijas bloķētāju.
- Lai gan pēc noklusējuma tas ir orientēts uz privātumu, lietotāji joprojām var to pielāgot savām vajadzībām.
- Atšķirībā no Firefox, **LibreWolf** ir neatkarīgs no Mozilla un to uztur privātumu cienoši izstrādātāji.

Pilnu iezīmju sarakstu var apskatīties [šeit](https://librewolf.net/docs/features/)

### Tagad instalēšu pakotņu pārvaldnieku - Scoop.

Es nāku no GNU/Linux lietu puses, kur tiek izmantoti pakotņu pārvaldnieki programmu un citu pakotņu instalācijai, nevis dodties uz katras programmas mājaslapu atsevišķi un lejupielādēt speciālu "instalētāju".
Uzskatu, ka šī metode kopumā ir labāka, tāpēc es izvēlēšos to izmantot šeit.
Dažas no šādas pieejas priekšrocībām:

- **Ērtība** - Pakešu pārvaldnieki vienkāršo instalēšanas procesu, apstrādājot atkarības un automātiski lejupielādējot nepieciešamos failus. Lietotājiem ir jāpalaiž tikai viena komanda.

- **Atkarību pārvaldība** - Daudzu programmu darbībai ir nepieciešamas citas bibliotēkas vai programmas. Pakotņu pārvaldnieki automātiski atrisina un instalē šīs atkarības, novēršot trūkstošo komponentu kļūdas.

- **Atjauninājumi un apkope** - Izmantojot pakotņu pārvaldnieku, lietotāji var viegli atjaunināt visas vai tikai dažas programmas vai bibliotēkas, izmantojot vienu komandu.

- **Drošība** - Pakotņu pārvaldnieki lejupielādē programmatūru no uzticamiem repozitorijiem.

- **Versiju kontrole** - Tie ļauj instalēt noteiktas versijas, kas ir ļoti svarīgi saderības vai testēšanas nolūkos.

Kā pakotņū pārvaldnieku izvēlējos **Scoop**, jo tas ir FOSS un instalē programmas tīrā, izolētā vidē, kas ļauj izvairīties no sistēmas līmeņa izmaiņām.

- Lai to instalēto ir jāizpilda sekojošās komandas no projekta [Github lapas](https://github.com/ScoopInstaller/Scoop):

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
    ```

- Jāizpilda **PowerShell** terminālī **bez** administrātora privilēģijām:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/scoop-install.png)

- Jāpiekrīt izpildes politikas maiņai, ievadot `a`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/scoop-install-a.png)

- Nedaudz pagaidu un **Scoop** ir instalējies:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/scoop-install-fin.png)

- Tagad var pamēģināt kaut-ko instalēt:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/scoop-neovim.png)

- Redzu, ka **Scoop** saka, ka kā atkarību **Neovim** prasa `vcredist2022` no `extra` repozitorija, mēģinu to pievienot, bet tam ir nepiecišams **Git** tāpēc instalēju arī to:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/scoop-git.png)

- Beidzot pievienoju `extra` repozitoriju un instalēju `vcredist2022`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/scoop-vcredist.png)

- Tagad varu izmēģināt un redzu, ka **Neovim** strādā:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/nvim-first.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/nvim-hw.png)

- Tagad instalēju pārējās nepieciešanas programmas:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/scoop-install-all.png)

- Kamēr tās instalējas - īsi pastāstīšu par tām:

    - **LibreOffice** - biroja programmatūras komplekts
    - **Chromium** - atvērtā koda interneta pārlūks, kas kalpo par bāzi daudziem citiem, tostarp arī **Google Chrome**, bet bez Google integrācijām un telemetrijas.
    - **Discord** - komunikācijas programma **Zoom** vietā
    - **mpv** - minimalistisks atskaņotājs
    - **GIMP** - "GNU Image Manipulation Program" attēlu manipulācijas programma
    - **Alacritty** - termināļa emulātors

- Pagaidot vēl kādu laiku - viss ir instalējies:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/scoop-install-all-fin.png)

### Tagad var pārbaudīt instalētās programmas.

- **LibreWolf** un foršas dzeloņcūkas:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/librewolf.png)

- **Chromium** un foršas dzeloņcūkas:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/chromium.png)

- **mpv** un forša dzeloņcūka:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/mpv.png)

- **Discord** komunikācijai:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/discord.png)

- **GIMP** augstai mākslai:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/gimp.png)

- **LibreOffice** un nedaudz teksta:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/libreoffice-intro.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/libreoffice.png)

- Izveidoju darbvirsmas saites instalētām programmām:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/icons.png)

### Vēl gribu instalēt Open-Shell lai nomainītu "Start" izvēlni uz "klasisko" (kādu varēja satikt Windows < vai = 7 versijās).

- **Open-Shell** instalēšu caur **Scoop**. Bet sākumā ir jāpievieno `nonportable` repozitorija, kurā **Open-Shell** arī atrodas.:

> Steam ir šeit jau instalēts jo šo daļu pievienoju vēlāk.

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/open-shell/scoop-bucket.png)

- Pēc tam mēģinu instalēt **Open-Shell**, bet nekas nesanāk jo izrādās, ka to ir jāinstalē ar administratora privilēģijām. Atveru **Alacritty** no administrātora vārda, mēģinu vēlreiz un tagad viss sanāk:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/open-shell/scoop-install.png)

- Varu mēģināt spiest `Start` pogu. To arī daru un redzu pirmās palaisšanas izvēlni. Tajā izvēlos `Windows 7 style` variantu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/open-shell/first-open.png)

- `Skin` sadaļā nedaudz izmaino to izskatu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/open-shell/skin.png)

- Spiežu `OK`, aizveru programmu un apskatu rezultātu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/open-shell/fin.png)

> Pirms attēla uzņemšanas arī izdzēsu daudzas nevajadzīgās ikonas.

### Tagad uzstādīšu programmēšanas vidi.

Kā koda redaktoru es izmantoju **Neovim**, ko jau bīju instalējis. "no kastes" tā ir diezgan minimāla, tāpēc es izmantoju tai daudzus plugin-us. Lai tos instalētu - sākumā instalēju **vim-plug** un pēc tam pārkopēju savus konfigurācijas failus.

- Lai instalētu **vim-plug** ir jāizpilda sekojošās komandas no [Github repozitorija](https://github.com/junegunn/vim-plug):

    ```powershell
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
        ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
    ```

- Tam izmantošu svaigi instalēto **Alacritty**:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/vim-plug.png)

- Tagad pārkopēju savus konfigurācijas failus sekojošajā direktorijā:
    `C:\Users\arvids_bakulis\AppData\Local\nvim`

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/nvim-dots.png)

- Veru vaļā **Neovim** un rakstu komandu `:PlugInstall` lai instalētu visus savus plugin-us:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/PlugInstall.png)

- Neaizmirstu izpildīt `:Mason` lai instalētu vajadzīgos valodu serverus:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/mason.png)

- Tagad var lietot, tikai speciālo ikonu simbolu vietā ir neatpazītie simboli. Tas tā ir jo nav instalēti **Nerd Fonts** fonti, kas is vajadzīgi šiem plugin-iem lai rādītu pareizus simbolus.

- Pievienoju **Scoop** `nerd-fonts` repozitoriju.

- Instalēt visus **Nerd Fonts** fontus ar **Scoop** izrādijās nav tik vienkārši, tāpēc iztikšu tikai ar **JetBrainsMono**, man tas patīk un īstenība tikai to arī es lietotu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/jet-brains.png)

- Tagad jāliek **Alacritty** lietot manu svaigi instalēto fontu.

- Lai to izdarītu - sākumā izveidoju mapi `alacritty` sekojošajā vietā:
    `C:\Users\arvids_bakulis\AppData\Roaming\alacritty`

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/alacritty-conf1.png)

- Tālāk izveidoju failu jaunizveidotajā mapē ar nosaukumu `alacritty.toml`

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/alacritty-conf2.png)

- Un šajā failā nosaku fontu, ko lietos **Alacritty**:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/alacritty-conf3.png)

- Viss gatavs, tagad ikonas strādā!

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/neovim-fin.png)

- Uzrkastu vienkāršu **C++** programmu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/cpp1.png)

- Programma uzrakstīta, bet kā lai to tagad kompilē?

- Caur **Scoop** instalēju **MinGW** kompilātorus:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/mingw-install.png)

- Tagad varu kompilēt savu programmu un skatīties kas sanāca:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/config/cpp-compile.png)

## Spēles instalācija un demonstrācija

### Izvēlējos vienu no savām mīļākajām spēlēm - **Metal Gear Rising: Revengeance**

<iframe width="480" height="270" src="https://www.youtube-nocookie.com/embed/RhMsboqMMzs?si=YhNL9-MLaofUYFhO&amp;start=18" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
<iframe width="480" height="270" src="https://www.youtube.com/embed/Of0uyPSnzp8?si=gpI80-wnQCltTSrl" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

- Lai to instalētu no savas **Steam** bibliotēkas man vispirms ir jāinstalē **Steam** caur **Scoop**:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/steam-install-err.png)

- Mēģinu to izdarīt, bet izrādās, ka **Steam** atrodas `games` repozitorijā, tāpēc tas sākumā ir jāpievieno ar `scoop bucket add games` (ne ar pirmo reizi kā jau vienmēr 🥲):

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/steam-install-bucket.png)

- Tagad atkal var mēģināt instalēt **Steam** un šoreiz viss sanāk:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/steam-install-fin.png)

- Veru **Steam** vaļā:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/steam-open.png)

- Un ienāku savā kontā:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/steam-login.png)

- Atveru izvēlēto spēli un spiežu `Download` lai to lejupielādētu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/mgr-wait.png)

- Nedaudz pagaidu un spēle ir ielādējusies:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/mgr-installed.png)

### Jau varu spiest `Play` lai to startētu, tomēr pirms tam es gribētu tomēr instalēt pilno grafisko dravieru un to palīgprogrammatūtas komplektu, nevis tikai minimālo ko Windows pats ir instalējis.

- Atveru video kartes ražotāja mājas lapu un sadaļā `Drivers` izvēlos savu karti (**RX 6700XT**):

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/driver/amd-web.png)

- Lejupielādēju to, nedaudz pagaidu un instalētājs atveras:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/driver/amd-install1.png)

- Izvēlos standarta instalāciju, tikai atsakos no telemetrijas un datu vākšanas:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/driver/amd-install2.png)

- Vēl nedaudz pagaidu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/driver/amd-install3.png)

- Un instalēcija ir beigusies, vār pārstartēt virtuālo mašīnu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/driver/amd-install-fin.png)

- Pēc pārstartēšanas redzu, ka viss ir instalējies un strādā:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/driver/amd-fin.png)

### Tagad varu atgriezties pie spēles.

- Startēju to, nokliksķinot divas reizes uz tās ikonu uz darbvirsmas.

- Bet nekas nenotiek...

- Internetā izlasu un arī pašam rodas aizdomas ka šāda problēma var būt sasitīta ar trūkstošiem **DirectX** failiem.

- Lai to risinātu es atveru [TechPowerUp mājaslapu](https://www.techpowerup.com/download/directx-redistributable-runtime/) un lejupielādēju **DirectX** kumulatīvo bezsaistes instalētāju:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/directx/web.png)

- Dearhivēju to nokliksķinot ar labo peles pogu, izvēloties `Extract All...`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/directx/unzip.png)

- **SmartScreen** atkal uzvedas. Ar to tieku galā kā jau iepriekš - spiežot `Run anyway`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/directx/not-so-smart.png)


- Jaunizveidotajā mapē ir dearhivētiem failiem atrodu `# install.bat` un palaižu to:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/directx/bat.png)

- Nedaudz pagaidu kamēr programma beidz savu darbu un var vēlreiz mēģināt palaist spēli. Tagad redzu, ka viss strādā:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/ingame/konami.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/ingame/anykey.png)

- Izvēlos `New Game` un nedaudz paskraidu apkārt lai parādīt, ka spēle funkcionē:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/ingame/newgame.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/ingame/gameplay1.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/ingame/gameplay2.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/ingame/gameplay3.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/ingame/gameplay4.png)

- Var redzēt ka spēlē nekā nav instalēta `Program Files` mapē:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/game/location.png)
 
## Punkti no darba nosacījuma

### Instalēju visus atjauninājumus:

#### no **Windows Update**:

- Atveru **Windows Update** un redzu, ka atjaunīnājums ir jau lejupielādējies un sācis instalēties automātiski, tagad ir nepiecišams restartēt sistēmu. To arī daru:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/upd/update1.png)

- Pēc restartēšanas spiežu `Check for updates` atkal un redzu, vēl ir palikuši neinstalēti atjuninājumi:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/upd/update2.png)

- Nedaudz pagaidu, tie arī instalējas, vēlreiz piespiežu `Check for updates` un tagad redzu, ka viss ir kārtībā un visi atajuninājumi ir instalēti:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/upd/update3.png)

#### no **Scoop**:

- Instalalēju atjaninājumus priekš paša **Scoop** ar `scoop update`,
- instalēju atjauninājumus priekš visā **Scoop** instalētām programmām ar `scoop update *`,
- pārbaudu rezultātu ar `scoop status`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/upd/update-scoop.png)

### Demonstrēju processu un servisu sarakstu:

#### Processi:

- Atveru **Task Manager** un izvēlos `Details` sadaļu, lai redzētu pilnu processu sarakstu:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/tasks/tasks1.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/tasks/tasks2.png)

#### Servisi:

- Atveru `Services` sadaļu, un parādu visus **aktīvos** servisus:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/tasks/services1.png)
![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/tasks/services2.png)

### Palaižu diska defragmentāciju:

- Atveru `Optimize Drives`, spiežu `Optimize`, nedaudz pagaidu un ir gatavs:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/defrag.png)

### Parādu "Device Manager" un to, ka visi draiveri ir instalēti:

- Nav dzeltenu trijstūrīšu - viss kārtībā:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/devices.png)

### Pievienoju Latviešu un Krievu valodas un uzrakstu tekstus visās 3 valodās:

- Atveru iestatījumu valodas sadaļu un spiežu `Add a new language`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/lang/lang-init.png)

- Izvēlnē izvēlos `Latviešu` un pievienoju to:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/lang/lang-lv2.png)

- Un izvēlos `Русский` un pievienoju to:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/lang/lang-ru2.png)

- Nedaudz pagaidu kamēr viss instalēsies... Un ir gatavs:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/lang/lang-wait.png)

- Tagad varu uzrakstīt teikumus visās 3 valodās 😎:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/lang/lang-test.png)

### Konfigurēju Pagefile:

- Atveru `System Properties`, pāreju `Advanced` sadaļā un pie `Performace` spiežu `Settings...`
- Atvērtajā logā pie `Virtual memory` spiežu `Change...`
- Un jau šajā logā:
    - Noņemu ķeksīti no `Automatically manage paging file size for all drives`
    - Apakšā izvēlos `Custom size` un nosaku limitus no `2048MB` līdz `8192MB` (no `2GB` līdz `8GB`):

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/pagefile/pagefile-fin.png)

### Palaižu Windows Safe mode režīmā:

- Šim punktam, lai varētu vieglāk uzņemt ekrāna attēlus, atvienoju virtuālai mašīnai fizisko karti un izmantošu grafikas emulāciju.

- Startējot mašīnu, pat neieejot savā lietotājā, turot `SHIFT` pogu, piespiežu "Strāvas" pogu un izvēlos `Restart`, neatlaižot `SHIFT`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/safemode/safemode-init.png)

- Atveras logs, kur izvēlos `Troubleshoot`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/safemode/safemode-troubleshoot.png)

- Šajā logā izvēlos `Advanced options`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/safemode/safemode-advanced.png)

- Tagad `Start-up Settings`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/safemode/safemode-startup-settings.png)

- Un `Restart`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/safemode/safemode-restart.png)

- Nedaudz pagaidu un sistēma ir startējusi **Advanced Boot Options** izvēlnē. Izvēlos `Safe Mode`:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/safemode/safemode.png)

- Vēl nedaudz pagaidu un Windows ir startējis **Safe Mode** režīmā:

![](https://raw.githubusercontent.com/kl3fry/os-hw-win/refs/heads/master/img/guest/misc/safemode/safemode-fin.png)

# Paldies par uzmanību!

> P.S. Ļoti atvainojos par tik vēlu iesūtīšanu.
