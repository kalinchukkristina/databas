<?php include 'navbar.php' ?>

    <article>

        <header>
        <h1>Redovisning av kursmoment i kursen Databas</h1>
        </header>

        <h3 id="greeting"></h3>
        
        <section>
        <h2>Kmom01</h2>
        <p>I det första kursmomentet har vi installerat miljön för kursen – databasen MariaDB, terminalklienten mariadb och desktopklienten Workbench. Än så länge känns det bra för att vi jobbade med SQL i webtec kursen så den delen känns inte helt ny. Det som är nytt är Workbench och jag tycker att det är mer användarvänligt att jobba i en desktopklient, så det är en av de delarna som jag ser fram emot. Det som är lite svårare att föreställa mig just nu är hur vi ska blanda in HTML/CSS och JS, det känns bra att jag läste både webtec och JS kurserna inför denna kurs, så det är inget jag fasar inför direkt.</p>
        <br>
        <p>Som sagt, har jag jobbat lite med SQLite databas i webtec kursen och det känns som SQLite och MariaDB är ganska liknande. </p>
        <br>
        <p>Arbetet med SQL i guiden gick rätt bra tycker jag. Jag gillar att vi tar en sak åt gången, testar olika konstruktioner och rusar inte in i språket på en gång. Det är välbeskrivet vad vi gör och vilka konstruktioner vi ska lära oss i respektive delar. Det som också är viktigt är att vi introduceras av en grundläggande konstruktion och sedan förväntas att skriva mer komplicerade konstruktioner utifrån den så att vi lär oss att tänka själva. </p>
        <br>
        <p>Än så länge har jag läst python och JS som är ”riktiga” programmeringspråk men det känns inte som SQL och python/js har mycket gemensamt för att de uppfyller olika syften. Men det känns ändå inte så komplicerat att följa logiken i SQL, det kan vara lite mer utmanade att använda rätt syntax men det kommer säkert med tiden. </p>
        <br>
        <p>TIL för detta kmom är lite mer förståelse kring olika typer av databaser, särskilt relationsdatabaser. </p>
        </section>

        <section>
        <h2>Kmom02</h2>
        <p>Den här veckan har vi bekantat oss med Node.js och fortsatte jobba med SQL. Det som var nytt för mig är UNION, JOIN och vyer. UNION använder vi när vi vill få information från två olika tabeller, UNION slår ihop rader från tabellerna enligt våra kriterier. Det är viktigt att båda tabellerna har samma struktur på kolumnerna, varje rad visas var för sig. </p>
        <br>
        <p>JOIN använder vi när vi vill visa information från två olika tabeller på samma rad, vi slår samman informationen baserad på nyckeln som finns i båda tabellerna. Join-vilkoret  anger vi i ett ON-statement, strukturen av SQL satsen ser ut så här: <i>SELECT &lt;tbl.columns, tbl_two.columns&gt; FROM &lt;table one&gt; AS tbl JOIN &lt;table two&gt; AS tbl_two ON tbl.key_column = tbl_two.key_column</i>. Jag uppfattar att skillnaden mellan JOIN och UNION är att i UNION skapar vi inte extra kolumner, vi bara adderar rader från en tabell till den andra. Med hjälp av JOIN adderar vi kolumner från en tabell till den andra och i båda tabellerna måste det finnas en kolumn som är nyckeln, med hjälp av vilken vi gör kopplingen. </p>
        <br>
        <p>Än så länge känns det okej även om UNION och JOIN är helt nya begrepp för mig, men jag ser nytta av de här metoderna. </p>
        <br>
        <p>Node.js är inte helt nytt för mig, vi jobbade med det i JS kursen, i första tre kmom i alla fall. Async egenskap av JavaScript har vi också sett i JS kursen, jag kan inte säga att jag gillar just den delen för att det är lite svårt att förstå flödet men async-await gör det lite mindre krångligt. Då vi skapar kopplingen till en databas och skickar en förfråga till den i form av ett SQL sats där vi har placeholders påminner om det vi gjorde i PHP, så det har jag erfarenhet av. Promisify, readline, until, input, output däremot har vi inte jobbat med i JS kursen, så den här delen har jag inte fattat så bra än.</p>
        <br>
        <p>Jag förstår dock varför vi behöver blanda in Node.js, det är nödvändigt om vi vill ha interaktion med användare, så att hen kan skriva vad vi ska leta upp i databasen. </p>
        <br>
        <p>TIL för detta kmom är att inte bara vi som programmerare kan skriva SQL satser och få ut information från en databas utan även en användare kan förse oss med en förfråga som vi med hjälp av vår kod kan uppfylla. </p>
        </section>

        <section>
        <h2>Kmom03</h2>
        <p>Den här veckan har vi skapat ett menydrivet terminalprogram med JS och Node.js och fortsatt jobba med SQL guiden. Än så länge känns det okej. Jag tror att jag följer flödet i mitt program. När man kommer in i programmet för första gången sätts prompten som lyssnar på vad man skriver in. Man kan skriva ”meny” och då visas det vilka alternativ som finns tillgängliga. När man skriver sitt val kommer flödet till switch cases och baserat på vad man väljer skickas det till respektive metod i modulen helpers.</p>
        <br>
        <p>Just nu så ser programmet bra ut men förbättringen som jag kan tänka mig är att inte skapa connection till databas i varje metod i helpers utan kanske skapa det i main och skicka som argument till metoder men jag är inte säker på var exakt jag skulle göra det - i funktionen handleInput() eller i namnlösa funktionen som anropar handleInput().</p>
        <br>
        <p>När jag jobbade med guiden kändes det som att vi börjar med en lite mer komplicerad del, särskilt märktes det i Subquery och Joins. Även om vi gjorde JOIN förra kursmomentet så var det INNER JOIN som vi lärde oss. Den här gången har vi lärt oss om OUTER JOIN. Skillnaden mellan INNER JOIN och OUTER JOIN är att INNER JOIN visar inte rader som inte matchar i tabellerna medan OUTER JOIN visar icke-matchande rader (då blir data NULL i de raderna). Det känns som att jag skulle behöva flera övningar för att förstå hur detta fungerar till fullo. </p>
        <br>
        <p>ER-modellering gick också utan större bekymmer. Jag tycker att informationen som vi fick i videor och i artikeln ”Kokbok för databasmodellering” var jättebra, det hjälpte mig mycket när jag utförde Konceptuell modellering. Mikaels video där han skapade diagrammen var också lärorik då han visade hur man gör det i verkligheten. Det enda som jag inte var säker på var om mitt tankesätt var rätt - om jag förstod texten rätt, skapade korrekta entiteter, attribut och relationer. Jag saknade möjligheten att diskutera med min lärare om jag var på rätt spår. Jag skulle vilja få feedback på den delen, om jag är på rätt väg? </p>
        <br>
        <p>Min TIL för detta kursmoment är att det är viktigt att skriva ett grundläggande dokument när man börjar skapa en databas. Även om jag bara gjorde det konceptuella steget så började jag tänka på hur det skulle kunna se ut i verkligheten. Jag har också insett varför vi gör ett terminalprogram med Node.js – det är för att antingen skapa ett nytt men likadant program eller modifiera ett existerande program (koppla till en annan databas och skriva om SQL queries) som skulle passa vår e-shop.</p>
        </section>

        <section>
        <h2>Kmom04</h2>
        <p>Denna vecka har vi börjat jobba med en webbklient med hjälp av Express.js, Node, EJS. Den här delen kändes inte lätt i början för att vi inte använde en egen server i js kursen så det var nytt för mig. Tack vare oopython kursen där vi blev bekanta med flask och jinja gick det smidigare senare när jag märkte många gemensamma koncept. Än så länge har jag lyckats att skapa route för att överföra pengar mellan konton. </p>
        <br>
        <p>Utvecklingen av terminalklienten gick också bra för att vi gjorde en liknande  terminalklient i kmom03. Denna gången har jag bytt ut meny och skapat menyval ”move”. Man kan skriva ”move” och då överförs 1.5 peng från Eva till Adam, ”move  <amount>” att överföra ett bestämt belopp från Eva till Adam och ”move  <amount>  <from>  <to>” att överföra ett bestämt belopp antingen från Eva till Adam eller från Adam till Eva. Jag gissade direkt att jag borde använda min split funktion på inputen för att få fram hur många argument användaren har skrivit. Beroende på antal argument kallar jag på olika funktioner som jag exporterar i filen bank.js. I själva sql satsen använder jag placeholders  för att kunna använda funktionen moveMoney() i alla tre fall.</p>
        <br>
        <p>Jag har börjat läsa om transaktioner i kursboken och jobbat igenom övningen. Jag förstår iden bakom transaktioner men det känns som det är mycket mer runt omkring koncepten än själva kodandet. Om sanningen ska fram, har jag inte försätt riktigt om det är jag som utvecklare som ska försäkra att transaktioner uppfyller ACID krav eller om jag inte behöver göra någonting angående det. Det fokuseras mycket på hur transaktioner ska  utföras och det nämns att DBMS spelar stor roll här men jag har inte förstått till fullo om jag behöver göra någonting extra för att hjälpa DBMS eller att processen sker helt automatiskt. Dessutom har jag inte förstått om det är jag som ska skapa logg filen själv eller den skapas automatiskt. </p>
        <br>
        <p>Jag har skapat den logiska modellen och sql ddl enligt kokboken. Det tog mig lite tid för att skriva sql ddl för att ordningen då man droppar tabeller spelar väldigt stor roll men det verkar som att jag har hittat rätt ordning. Jag har inte gjort steg 10 för att jag inte vet vilka API det menas. I krav 3 i uppgiften står det att man inte ska göra INSERT, UPDATE, DELETE eller SELECT än så länge (är det det som menas under ” funktioner som databasen skall stödja?”) Det verkar i alla fall som den delen kommer i följande kursmoment så jag har bestämt mig för att vänta med det.</p>
        <br>
        <p>Så här långt känns det bra, jag förstår vad jag gör och försöker att utnyttja allt material som vi får på föreläsningar, övningar och på frågestund. </p>
        </section>

        <section>
        <h2>Kmom05</h2>
        <p>Denna vecka har vi jobbat med kursmoment 05. Uppgiften var mycket större än de som vi hade innan. Vi har lärt oss att jobba med triggers och lagrade procedurer. Jag kan inte säga direkt att jag förstår till fullo hur allt fungerar, jag saknade verkligen någon praktisk ”frågestund” denna vecka. Jag förstår inte direkt vilka fördelar lagrade procedurer ger oss förutom de fallen då vi behöver använda variabler. Jag förstår inte fördelar med lagrade procedurer särskilt när jag behövde skriva enkla SQL-satser (t.ex krav 5, 6, 7 och 8 i terminalklient delen). Det står i uppgiften att  ”all access från klienten mot databasen skall gå via lagrade procedurer”, jag har gjort så men återigen så ser jag inte hur det gynnar mig kodmässigt. </p>
        <br>
        <p>Triggers använder vi när vi vill att någonting ska hända efter en annan händelse. I uppgiften har vi använt triggers för att hålla kolla på vad som läggs till och raderas från databasen. Lagrade procedurer använder vi när vi behöver ha variabler, if-satser eller loopar i vår SQL kod. De ger oss också möjlighet att t.ex spara information från en select sats i en variabel. I mitt fall ser jag verkligen fördelar av lagrade procedurer i krav 10, 11 och med CRUD.</p>
        <br>
        <p>Det var lite lättare att komma igång med webbklienten tack vare lektionen med Kenneth, han förklarade bra hur allt fungerade.</p>
        <br>
        <p>Det var lite svårare med terminalklienten eftersom vi inte hade någon lektion som gick igenom den ”praktiska” delen, men jag har försökt att implementera alla krav. Jag vill poängtera att med ”invadd” kommando kan man lägga till någon produkt på en hylla om den produkten redan finns i ”produkt” tabellen, det var inte specificerat i kraven så i mitt fall har jag gjort det så att man kan antingen uppdatera antal av en produkt om den finns i lager eller kan man lägga till existerande produkt (inte produkt som inte finns i produktregister överhuvudtaget).</p>
        <br>
        <p>Jag har jobbat själv. Min backupdatabas heter ”eshop1”.</p>
        </section>

        <section>
        <h2>Kmom06</h2>
        <p>Index är viktigt för att när man jobbar med en databas är det vanligtvis stora mängder av data som databasen innehåller och index hjälper till att komma åt viss data snabbt. Med hjälp av index kan vi slippa utföra ”full table scan (att varje rad i tabellen ska gås igenom för att hitta den matchande raden)”. Index markerar kolumnen så att databashanterare hittar direkt rätt svar i tabellen. Vanligtvis skapas index för kolumner som kommer att användas ofta i select-satser.</p>
        <br>
        <p>I min eshop har jag skapat extraindex för tabellerna produkt (kolumn ”namn”), ordrar (kolumn ”rader”) och plocklista_rad (kolumn ”order_id”) eftersom jag använder de här kolumnerna ofta i select-satser (förutom de som är primary keys och foreign keys). Med tanke på att min databas är så liten så tror jag inte att det påverkar exekveringstiden så mycket, index gör skillnad i större databaser men det är nyttigt att få lära mig hur man jobbar med index. </p>
        <br>
        <p>Funktioner i databas används för att underlätta hur vi bearbetar data. Funktioner kan innehålla loopar, if-satser och måste returnera resultat av en viss operation. Det kan vara nyttigt när vi vill få ut något resultat beroende på inkommande parametrar  (som t.ex status på en order i eshopen).</p>
        <br>
        <p>Jag är rätt nöjd med min eshop. Jag har inte fokuserat så mycket på utseende i webbklienten för att jag inte hann men funktionaliteten fungerar som den ska. När man kommer på routern ”eshop/customer” kan man skapa en order genom att trycka på ”create order ” knappen, då skapas det en tom order med status ”created”. På routern ”eshop/myorder/:id” ser kunden sina föregående ordrar samt den nyskapade ordern, den nyskapade ordern är alltid sist. När man trycker på knappen ”Modify” kommer man till routern ”current_order/:id”, här kan man lägga till produkter (det skapas en ny orderrad varje gång) och trycka på knappen ”Place order” för att byta orderstatus till ”Ordered”. Efter att man har lagt till produkter och tryckt på knappen ”Place order”   blir man redirected till ”eshop/order” där man kan se sin order med uppdaterad status. Om man klickar på order_id ser man samtliga orderrader som ordern innehåller. Om man lägger till produkter på ordern men inte trycker på knappen ”Place order” har ordern status ”Updated”.</p>
        <br>
        <p>I terminalklienten kan man skapa en plocklista för ordern och byta status till ”Sent”. </p>
        <br>
        <p>Jag har gjort så att man inte kan beställa produkten om den inte finns på lager, därför har jag inte gjort någon utskrift för krav 5.</p>
        <br>
        <p>Jag tycker att uppgiften var väldigt svår, det känns som det skulle passa bättre som ett projekt i kursen. Det tog mig mycket tid för att lista ut logiken för hur man skapar order med orderrad, hur det ska hänga ihop. Dessutom tog det mycket tid att tänka igenom hur man skulle även kunna generera en plocklista med rader baserad på ordern. </p>
        <br>
        <p>Jag har inte hunnit att implementera något extrakrav tyvärr. Backup filen för detta kursmomentet heter ”backup06.sql” och backupdatabasen är ”eshop2”.</p>

        </section>

        <section>
        <h2>Kmom07-10</h2>
        <p>I tentan har jag löst Uppgift 1, Uppgift 2 och Uppgift 3. I Uppgift 2 har jag tolkat det som att man bara skulle kunna söka på fiskarnas namn (inte latinska namn), familjernas namn (inte latinska namn) och bara lokalernas namn (inte rum).</p>
        <br>
        <p>I Uppgift 3 har jag lyckats få fram utskriften som i exemplet men en sak som jag verkligen inte kunde klura ut var hur jag inte skriver ut någonting alls i varningskolumnen om temperaturen är inom ramen. För varningskolumnen har jag skapat en funktion som returnerar antingen ”Hög temp” eller ”Låg temp” (jag var också tvungen att bli av med å och ö bokstäver för att det blev en ful utskrift med dem), men om ingen av if-satserna blev True returnerar jag en tom sträng, det gick inte att inte returnera någonting alls, jag var tvungen att returnera någonting. Jag försökte bli av med den tomma strängen med hjälp av COALESCE funktion men visste inte om var den rätta vägen för att jag har aldrig använt den funktionen innan, men jag lyckades inte med den idén. </p>
        <br>
        <p>Jag tycker att den tredje uppgiften var svårare än motsvarande uppgifter från tidigare tentor (jag gjorde Hund, Vaccin och Vapen). Men det kändes ändå ganska bra att vi fick träna med gamla tentor, så att vi visste vad skulle förvänta oss. Jag upplever att det var en rimlig tenta för denna kurs, lagom svår. Jag kände att jag fick bra kunskaper under kursen för att lösa uppgifter. Det tog mig ungefär 4.5 timme för att lösa tentan och den sista halvtimmen försökte jag fixa den tomma strängen. Uppgift 1 var ganska lätt, det hade vi gjort många gånger tidigare – visa utskriften. Själva SQL frågan tog mig lite tid för att jag behövde få ut information från alla fyra kolumner och behövde använda olika JOIN konstruktioner men det gick bra till slut. Jag rätt nöjd med det jag lyckades lösa (förutom den tomma strängen).</p>
        <br>
        <p>Jag är ganska nöjd med kursen och de kunskaper jag fick. Guiden ”Kom igång med SQL i MySQL” var riktig bra, jag gillade att vi fick följa alla viktiga delar i ordningen och göra uppgifter samtidigt. Det enda som jag saknade var lektioner om SQL med Mikael, jag kollade frågestund och inspelade lektioner men jag saknade ändå direkt interaktion med lärare för att Kenneth fokuserade mest på JS delen. Jag saknade allmän information om hur allt skulle hänga ihop i eshopen, hur flödet borde gå till mellan ordrar, fakturor, plocklistor, lager osv. Vi fick implementera eshopen direkt men jag skulle uppskatta om vi tog upp hur en eshop fungerar på riktigt innan vi började på eshop uppgiften så att vi kunde få en större bild av systemet. Men återigen tycker jag ändå att kursen var bra, jag gillade upplägget särskilt SQL delen. Jag ger kursen en sjua. </p>
        <br>
        <p>Jag har inte gjort ehsop3.</p>
        </section>

        <h3 class="myDate"></h3>
        </article>

        <?php include 'footer.php' ?>

    <script src="js/main.js"></script>
</body>
</html>
