Quel Pokémon es-tu ?
Le service rendu par l'application
L'application "Quel Pokémon es-tu ?" est un service web ludique qui associe un Pokémon de la première génération (parmi les 151 premiers) au prénom de l'utilisateur. En saisissant simplement son prénom, l'utilisateur découvre son "Pokémon totem" accompagné de son nom officiel et de son illustration.
Le fonctionnement global
L'application est construite avec le langage Go et fonctionne de la manière suivante :
Interface Web : Une page HTML simple sert d'interface. L'utilisateur y entre son prénom dans un formulaire via une méthode HTTP GET.
Attribution déterministe (Hachage) : Le backend récupère le prénom fourni et génère un identifiant de Pokémon de manière déterministe. Pour s'assurer qu'un même prénom donne systématiquement le même Pokémon, l'application calcule le hachage SHA-1 du prénom, puis lui applique un modulo 151 (et y ajoute 1).
Appel à l'API externe : Avec cet identifiant calculé, le serveur effectue une requête à l'API publique externe PokeAPI (`https://pokeapi.co/api/v2/pokemon/{id}`) pour récupérer le nom officiel du Pokémon correspondant.
Rendu Dynamique : Le serveur utilise le package `html/template` de Go pour injecter le nom du Pokémon, son image (récupérée directement depuis le dépôt d'artworks de PokeAPI), le prénom de l'utilisateur et la version de l'application dans le fichier `index.tmpl.html`, puis renvoie la page au navigateur web.
Comment lancer le service sur son poste
Prérequis
Avoir Go installé sur votre machine.
Instructions de lancement
Téléchargez ou clonez le code source dans un répertoire sur votre poste.
Ouvrez un terminal et placez-vous dans ce répertoire.
Exécutez l'application avec la commande suivante :
```bash
   go run main.go
   ```
Ouvrez votre navigateur web et accédez à l'adresse suivante :
http://localhost:8080
Configuration (Optionnelle)
L'application peut être configurée via des variables d'environnement au lancement :
`ADDR` : L'adresse d'écoute de l'interface réseau (par défaut `0.0.0.0`).
`PORT` : Le port d'écoute du serveur web (par défaut `8080`).
`VERSION` : La version affichée sur l'interface web (par défaut `dev`).
Exemple de lancement avec un port différent :
```bash
PORT=9090 go run main.go
```
