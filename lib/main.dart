import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: home_page(),
    debugShowCheckedModeBanner: false,
  ));
}

class home_page extends StatelessWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Zodiaco Karma"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: body());
  }
}

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  String _dropdownvalue = 'Capricórnio';

  final _images = {
    'Aquário':'aquario.png',
    'Áries':'aries.png',
    'Câncer':'cancer.png',
    'Capricórnio':'capricornio.png',
    'Escorpião':'escorpiao.png',
    'Gêmeos':'gemeos.png',
    'Leão': 'leao.png',
    'Libra':'libra.png',
    'Peixes':'peixes.png',
    'Sagitário':'sagitario.png',
    'Touro':'touro.png',
    'Virgem':'virgem.png'};

  final _items = ['Capricórnio','Áries', 'Touro', 'Câncer', 'Leão', 'Virgem', 'Libra', 'Escorpião',
    'Gêmeos', 'Aquário', 'Peixes', 'Sagitário'];

  final _karmas = {
    'Áries':'Você traz consigo um espírito altamente competitivo, pois tem a necessidade de estar na frente dos outros. Esse instinto de liderança jamais permitiu que aceitasse ser passada para trás. Para vencer os obstáculos nesta vida, procure controlar a sua impulsividade e agressividade.',
    'Capricórnio':'Suas experiências astrais deixaram você exigente demais. Fã de regras, acredita que para vencer na vida é preciso disciplina e perseverança. Nesta encarnação, não seja tão ríspido(a) consigo e não deixe de viver uma linda história de amor por causa de suas obrigações profissionais. Lembre-se de que o sucesso é muito mais gostoso quando é dividido com as pessoas que amamos.',
    'Gêmeos':'A inconstância é a sua herança astral. Fazendo mil contatos e dividindo-se em várias atividades ao mesmo tempo, tem dificuldade de se aprimorar em uma área de atuação e firmar um compromisso mais sério com alguém.',
    'Peixes':'Para você, sempre foi mais fácil viver num mundo imaginário do que encarar a dura realidade. Mas ao tentar desviar-se dos problemas, sem querer, acaba criando certa dependência dos outros, tornando-se frágil e inseguro(a). Nesta encarnação, supere de vez o seu carma, desprendendo-se das suas fantasias. Veja o mundo como ele é para não sofrer desilusões mais tarde.',
    'Touro':'Você carrega consigo o apego aos bens materiais e a dificuldade de se adaptar a novas situações. Herdou do seu signo uma forte teimosia e resistência a mudanças. Nesta vida, tenha cuidado com a sua possessividade, que pode prejudicar os seus relacionamentos em geral.',
    'Câncer':'Muitas vezes, deixou de satisfazer as suas próprias vontades e cultivou dentro de si a dependência emocional. Com isso, colocou a sua felicidade nas mãos de outras pessoas, tornando-se vulnerável.',
    'Leão':'Dono(a) de uma vaidade extremamente aguçada, traz o egocentrismo como herança astral. Esse seu lado exibicionista, muitas vezes, é alvo de discórdia e de competição. Nesta vida, desligue-se mais do seu ego e do seu jeito mandão para se preocupar mais com o que acontece à sua volta.',
    'Virgem':'As suas experiências astrais foram marcadas pelo seu perfeccionismo. Saiba que essa rigidez impede que você curta os momentos de prazer. Seja menos exigente consigo e com as falhas alheias.',
    'Libra':'Traz consigo o carma da indefinição. Ao deixar de lado sempre os seus objetivos, acaba anulando os seus desejos por causa dos outros. Desta vez, aprenda a dizer não para as coisas que ferem os seus princípios. Não esconda mais uma vez as suas vontades!',
    'Escorpião':'A desconfiança é uma das principais características que herdou do seu signo. Com essa mania de entregar-se por inteiro, muitas vezes, sofreu grandes desilusões. Por isso, sempre fica com um pé atrás em relação às pessoas que se aproximam de você. Use a sua intuição aguçada para identificar o perigo de longe.',
    'Sagitário':'Sempre apresentou dificuldades para se adaptar às regras que eram impostas pela sociedade, por isso, carrega no peito a bandeira da liberdade. Embora se orgulhasse dessas atitudes, na maioria das vezes, elas dificultaram a sua adaptação social. Para se dar bem nesta vida, modere os seus exageros e o grau da sua sinceridade para conviver pacificamente com os demais. ',
    'Aquário':'Inúmeras vezes, sacrificou as suas vontades para dedicar-se aos outros. Só que a falta de concentração em si é a grande responsável pelo seu insucesso e pela sua rebeldia. Desta vez, procure viver plenamente o presente e amenizar o seu lado rebelde, se não quiser atrair desentendimentos e inimizades para o seu lado;',
  };

  String karma = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Image.asset("images/zodiaco.png"),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0 , 0, 20),
              child: Text(
                "Saiba o karma do seu signo",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: ResizeImage(AssetImage('images/${_images[_dropdownvalue]}'), width: 16, height: 16)),
                DropdownButton(
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    icon: Icon(null),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    value: _dropdownvalue,
                    items: _items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _dropdownvalue = newValue!;
                        karma = _karmas[_dropdownvalue].toString();

                      });
                    }),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Text(
                karma,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
void main() {
  runApp(const MyApp());
}
/*
Stateless -> widgets que não podem ser alterados
Stateful -> Widgets que podem ser alterados
 */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      home: Homeful(),
    );
  }
}

class Homeful extends StatefulWidget {
  const Homeful({Key? key}) : super(key: key);

  @override
  State<Homeful> createState() => _HomefulState();
}

class _HomefulState extends State<Homeful> {
  var _texto = "rafaedsasl";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Text(_texto),
          ElevatedButton(
            onPressed: (){
              setState((){
                _texto = "rafale";
              });
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold)),
            child: const Text("Clique aqui"),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagra"),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text("Texto blablabla"),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("data"),
              Text("data"),
              Text("data"),
            ],
          ),
        ),
      ),
    );
  }
}
*/
