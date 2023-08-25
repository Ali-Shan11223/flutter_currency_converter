import 'package:flutter/material.dart';

class CurrencyConverterScreen extends StatefulWidget {
  const CurrencyConverterScreen({super.key});

  @override
  State<CurrencyConverterScreen> createState() =>
      _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  double currency = 0.0;
  TextEditingController textEditingController = TextEditingController();

  void convertCurrency() {
    currency = (double.parse(textEditingController.text) * 300);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.white));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'PKR ${currency.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: textEditingController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  hintText: 'Enter amount in USD',
                  prefixIcon: const Icon(
                    Icons.monetization_on,
                    size: 25,
                  ),
                  isDense: true,
                  focusedBorder: border,
                  enabledBorder: border),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: convertCurrency,
              child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: const Center(
                      child: Text(
                    'Convert',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
