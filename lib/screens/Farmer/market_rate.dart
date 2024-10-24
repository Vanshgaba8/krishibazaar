import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MarketDataPage extends StatefulWidget {
  const MarketDataPage({super.key});

  @override
  State<MarketDataPage> createState() => _MarketDataPageState();
}

class _MarketDataPageState extends State<MarketDataPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;
  String? _error;
  List<dynamic> _marketData = [];
  String _searchType = 'Market'; // Default is market

  // Dropdown options
  final List<String> _searchOptions = ['Market', 'District'];

  Future<void> _fetchMarketData(String input) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    final apiKey = '579b464db66ec23bdd00000185dd46a797d846526c170251b775b051';
    final filterType = _searchType == 'Market' ? 'market' : 'district';
    final apiUrl =
        'https://api.data.gov.in/resource/9ef84268-d588-465a-a308-a864a43d0070?api-key=$apiKey&format=json&filters[$filterType]=$input';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _marketData = data['records'];
          if (_marketData.isEmpty) {
            _error = 'No data found for the specified $_searchType.';
          }
        });
      } else {
        setState(() {
          _error = 'Failed to fetch data';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Error fetching data: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _startSearch() {
    if (_searchController.text.isNotEmpty) {
      _fetchMarketData(_searchController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8D8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8D8),
        title: const Text(
          'Market Rates',
          style: TextStyle(color: Colors.brown),
        ),
        iconTheme: const IconThemeData(color: Colors.brown),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown for Market/District selection
            DropdownButton<String>(
              value: _searchType,
              items: _searchOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _searchType = newValue!;
                });
              },
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Enter ${_searchType} Name',
                suffixIcon: TextButton(
                  onPressed: _startSearch,
                  child: const Text(
                    'Search',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onSubmitted: (value) {
                _startSearch(); // Search triggered by Enter key
              },
            ),
            const SizedBox(height: 20),
            _isLoading
                ? const CircularProgressIndicator()
                : _error != null
                    ? Text(_error!, style: const TextStyle(color: Colors.red))
                    : Expanded(
                        child: ListView.builder(
                          itemCount: _marketData.length,
                          itemBuilder: (context, index) {
                            final item = _marketData[index];
                            return Card(
                              color: Colors.green[100],
                              child: ListTile(
                                title: Text(
                                    '${item['commodity']} - ₹${item['modal_price']}/quintal'),
                                subtitle: Text(
                                    'Market: ${item['market']}\nDate: ${item['arrival_date']}'),
                              ),
                            );
                          },
                        ),
                      ),
          ],
        ),
      ),
    );
  }
}
