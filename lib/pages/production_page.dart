import 'package:flutter/material.dart';

class Production extends StatelessWidget {
  const Production({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: const Text('Produção'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 30,
              color: Colors.greenAccent[400],
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: 120,
                    child: const Text('Código', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 4,
                    child: const Text('     Produto', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black))
                  ),
                  const Text('Tempo Previsto (Minutos)', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 30,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: 3000,
                itemBuilder: (context, index){
                  return Column(
                    children: [
                      index == 0 ? const SizedBox(height: 10,) : Container(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Container(
                              width: 40,
                              margin: const EdgeInsets.only(right: 80),
                              alignment: Alignment.center,
                              child: Text(index.toString(), textAlign: TextAlign.center,)
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.65,
                              child: const Text('Cabo X560')
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 16,
                              child: const Text('1,6')
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                }
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: 50,
        child: ElevatedButton(
          onPressed: (){
            showDialog(
              context: context,
              barrierColor: Colors.black26,
              builder: (context){
                return const AddItem();
              }
            ).whenComplete((){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  backgroundColor: Colors.greenAccent[700],
                  content: const Text("Produto Adicionado", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                ),
              );
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent[700],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)
            )
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.add, color: Colors.black,),
              SizedBox(width: 10,),
              Text('Adicionar Manualmente', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
            ],
          )
        ),
      ),
    );
  }
}

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  bool loading = false;
  String? error;
  final TextEditingController controllerCode = TextEditingController();
  final TextEditingController controllerName = TextEditingController();

  getProduct(String text){
    setState(() {
      loading = true;
    });
    Future.delayed(const Duration(seconds: 1)).then((value){
      setState(() {
        if(text == 'TEST123'){
          loading = false;
          controllerName.text = 'Cabo X580';
        } else {
          loading = false;
          error = 'Oops! Este produto não pertence a sua linha';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 64,
                spreadRadius: 4,
              )
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                title: const Text("Adicionar Item", style: TextStyle(fontWeight: FontWeight.bold),),
                trailing: IconButton(onPressed: ()=> Navigator.pop(context), icon: const Icon(Icons.close_outlined)),
              ),
              const Divider(),
              error == null ? const SizedBox(height: 60,):
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                decoration: BoxDecoration(
                  color: Colors.redAccent[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(error!,),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Código do produto', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: controllerCode,
                      onChanged: (text){
                        if(text.length >= 7){
                          getProduct(text);
                        } else {
                          setState(() {
                            error = null;
                            controllerName.clear();
                          });
                        }
                      },
                    ),
                    loading ?
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: LinearProgressIndicator(),
                    ) : const SizedBox(height: 10,),
                    
                    const Text('Nome do Produto', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
                    const SizedBox(height: 10,),
                    TextFormField(
                      controller: controllerName,
                      readOnly: true,
                    ),
                    const SizedBox(height: 20,),
                    controllerName.text.isEmpty ?
                    const SizedBox(height: 130,):
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return Column(
                          children: [
                            index == 0 ? Container() : const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Teste ${index ++}'),
                                Text('OK', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.greenAccent[700]),),
                              ],
                            ),
                          ],
                        );
                      }
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              ),
              const Divider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    margin: const EdgeInsets.only(right: 20, bottom: 20, top: 10),
                    child: ElevatedButton(
                      onPressed: ()=> Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)
                        )
                      ),
                      child: const Text(
                        'Adicionar',
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}