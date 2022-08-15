import 'package:flutter/material.dart';
import 'package:valet_apps/components/header_with_search_box.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        HeaderWithSerachBox(),
        TotalCustomers(),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                alignment: Alignment.centerLeft,
                child: Text("Parking",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              ParkItem(
                kodeSeri: "MZ",
                kodeWilayah: "D",
                merk: "Toyota",
                nomorPolisi: "B163726",
                urlGambar:
                    "https://www.toyota.astra.co.id/sites/default/files/2021-11/veloz-2021-NEW.png",
              ),
              ParkItem(
                kodeSeri: "MZ",
                kodeWilayah: "D",
                merk: "Toyota",
                nomorPolisi: "B163726",
                urlGambar:
                    "https://www.toyota.astra.co.id/sites/default/files/2019-06/CHR-HYBRID.png",
              ),
              ParkItem(
                kodeSeri: "MZ",
                kodeWilayah: "D",
                merk: "Toyota",
                nomorPolisi: "B163726",
                urlGambar:
                    "https://www.toyota.astra.co.id/sites/default/files/2021-11/camry-hybrid-2021-NEW_0.png",
              ),
              ParkItem(
                kodeSeri: "MZ",
                kodeWilayah: "D",
                merk: "Toyota",
                nomorPolisi: "B163726",
                urlGambar:
                    "https://www.toyota.astra.co.id/sites/default/files/2021-11/veloz-2021-NEW.png",
              ),
              ParkItem(
                kodeSeri: "MZ",
                kodeWilayah: "D",
                merk: "Toyota",
                nomorPolisi: "B163726",
                urlGambar:
                    "https://www.toyota.astra.co.id/sites/default/files/2019-09/COROLLA-ALTIS-HYBRID.png-min_0.png",
              ),
            ],
          ),
        )
      ],
    ));
  }
}

class TotalCustomers extends StatelessWidget {
  const TotalCustomers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                InfoCard(
                  effectedNum: 301,
                  tittle: "Today",
                  iconColor: Colors.green,
                ),
                InfoCard(
                  effectedNum: 900,
                  tittle: "Current Week",
                  iconColor: Colors.red,
                ),
                InfoCard(
                  effectedNum: 1098,
                  tittle: "Last Week",
                  iconColor: Colors.purple,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ParkItem extends StatelessWidget {
  final String nomorPolisi;
  final String merk;
  final String kodeWilayah;
  final String kodeSeri;
  final String urlGambar;
  const ParkItem({
    Key? key,
    required this.nomorPolisi,
    required this.kodeWilayah,
    required this.kodeSeri,
    required this.merk,
    required this.urlGambar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      padding: EdgeInsets.all(5),
      height: MediaQuery.of(context).size.height * 0.1 - 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue.withOpacity(0.2),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 10),
                blurRadius: 50,
                color: Colors.blue.withOpacity(0.23))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network("$urlGambar"),
          Text("$nomorPolisi"),
          Text("$merk"),
          Text("$nomorPolisi $kodeWilayah"),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String tittle;
  final int effectedNum;
  final Color iconColor;
  const InfoCard({
    Key? key,
    required this.tittle,
    required this.effectedNum,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, snapshot) {
      return Container(
        width: MediaQuery.of(context).size.width / 2 - 25,
        // height: MediaQuery.of(context).size.height * 0.19 - 30,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: iconColor.withOpacity(0.6),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.local_parking_sharp,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    tittle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "$effectedNum\n",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold, color: iconColor)),
                    // TextSpan(
                    //     text: "Customers",
                    //     style: TextStyle(fontSize: 12, height: 2))
                  ])),
                ),
                // Expanded(child: LinearReportChart())
              ],
            ),
          ],
        ),
      );
    });
  }
}
