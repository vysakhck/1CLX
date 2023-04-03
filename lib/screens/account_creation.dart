import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:project/extensions/context_extensions.dart';
import 'package:project/screens/complete_page.dart';
import 'package:project/ui/custom_dropdown_button.dart';

import '../utils/1clx_theme.dart';

class AccontCreaionPage extends StatefulWidget {
  const AccontCreaionPage({super.key});

  @override
  State<AccontCreaionPage> createState() => _AccontCreaionPageState();
}

class _AccontCreaionPageState extends State<AccontCreaionPage> {
  int _currentIndex = 0;
  final PageController _controller = PageController();

  List<Map<String, String>> headerList = [
    {"icon": 'assets/BP.png', "title": 'Business Profile'},
    {"icon": 'assets/info.png', "title": 'Location & Contact Info'},
    {"icon": 'assets/GL.png', "title": 'Google Location'},
    {"icon": 'assets/BD.png', "title": 'ADD BUSINESS DESCRIPTION'},
    {"icon": 'assets/BI.png', "title": 'ADD BUSINESS IMAGES'},
    {"icon": 'assets/BI.png', "title": 'ADD BUSINESS IMAGES'},
    {"icon": 'assets/BI.png', "title": 'ADD BUSINESS IMAGES'},
    {"icon": 'assets/pub.png', "title": 'PUBLISH'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colorScheme.primary,
                  Colors.white,
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: const [0, 0.3],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset('assets/img1.png'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset('assets/img2.png'),
          ),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        headerList[_currentIndex]['icon']!,
                        width: 64,
                        height: 64,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        headerList[_currentIndex]['title'] ?? '',
                        style: TextStyle(
                          color: context.colorScheme.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '$_currentIndex of 7 Completed',
                      style: TextStyle(color: context.colorScheme.primary),
                    ),
                    LinearPercentIndicator(
                      animation: true,
                      animateFromLastPercent: true,
                      percent: (_currentIndex + 1) / 8,
                      backgroundColor: context.colorScheme.primary,
                      progressColor: Colors.white,
                      lineHeight: 12,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      barRadius: const Radius.circular(16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (value) => setState(() {
                      _currentIndex = value;
                    }),
                    children: const [
                      Page1(),
                      Page2(),
                      Page3(),
                      Page4(),
                      Page5(),
                      Page6(),
                      Page7(),
                      Page8(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_currentIndex != 0)
                        IconButton(
                          onPressed: () => setState(() {
                            _controller.previousPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.linear);
                          }),
                          icon: Image.asset('assets/Lefi.png'),
                        ),
                      const SizedBox(width: 16),
                      const Text('SWIPE'),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: () => setState(() {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.linear);
                        }),
                        icon: Image.asset('assets/Right.png'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'CREATE BUSINESS PROFILE',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text('Start Building Your \n Business Profile'),
          const SizedBox(height: 18),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 24,
              ),
              hintText: 'Bussiness Name',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 14,
          ),
          CustomDropdownButton(
            hintText: 'State',
            selectedItems: const [],
            items: const [],
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final CountryService _countryService = CountryService();
  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            'ADD A BUSINESS LOCATION',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 22,
          ),
          CustomDropdownButton(
              hintText: 'Select Country',
              selectedItems: _countryService
                  .getAll()
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            e.name,
                            style:
                                TextStyle(color: context.colorScheme.primary),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              items: _countryService
                  .getAll()
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.name),
                          Text(e.flagEmoji),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (Country? country) {
                setState(() => _selectedCountry = country);
              }),
          const SizedBox(
            height: 14,
          ),
          CustomDropdownButton(
            hintText: 'State',
            selectedItems: const [],
            items: const [],
            onChanged: (value) {},
          ),
          const SizedBox(
            height: 14,
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 24,
              ),
              hintText: 'City',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 14,
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorScheme.primary),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorScheme.primary),
                  borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 24,
              ),
              hintText: 'Pincode',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 14,
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: context.colorScheme.primary),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: context.colorScheme.primary),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 24,
              ),
              hintText: 'Address Line',
              prefixIcon: Container(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    showCountryPicker(
                        context: context,
                        countryListTheme: const CountryListThemeData(
                          bottomSheetHeight: 550,
                        ),
                        onSelect: (value) {
                          setState(() => _selectedCountry = value);
                        });
                  },
                  child: Text(
                    _selectedCountry?.flagEmoji ?? '🇺🇸',
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            'PIN YOURBUSINESS LOCATION',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text('Add Map Location \n For Your Business'),
          const SizedBox(
            height: 36,
          ),
          Container(
            height: 240,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(11.664325, 78.146011),
                zoom: 8,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(11.664325, 78.146011),
                      builder: (context) => Icon(
                        Icons.location_pin,
                        color: Colors.red[700],
                        size: 32,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            'PIN YOUR BUSINESS LOCATION',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Provide an overview of the \n business. This description provides \n extensive details outlining the business.',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              hintText:
                  'Enter your business overview for about page description.',
              hintStyle: const TextStyle(fontSize: 12),
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 24,
              ),
              hintText: 'Email Id',
              hintStyle: const TextStyle(fontSize: 12),
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 16,
          ),
          TextField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 24,
              ),
              hintText: 'Existing Website URL (Optional)',
              hintStyle: const TextStyle(fontSize: 12),
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            'ADD PHOTOS OF YOUR BUSINESS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Business photos create your customer \'s first \n impression of your company. The best \n photos send a message to customers about the company \'s value, create brand loyalty, and sign a more professional appearance.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Upload Image for your business the \n website is effective and creative',
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(
            height: 22,
          ),
          SizedBox(
            width: 128,
            height: 40,
            child: ElevatedButton(
              onPressed: null,
              style: buttonTheme(
                color: const Color(0xFF5E86EC),
              ).copyWith(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5);
                    } else if (states.contains(MaterialState.disabled)) {
                      return const Color(0xFF9FBAFF);
                    }
                    return const Color(0xFF5E86EC);
                  },
                ),
              ),
              child: Text(
                'Upload Logo',
                style:
                    context.textTheme.titleSmall?.copyWith(color: Colors.white),
              ),
            ),
          ),
          const PlaceholderImage(),
        ],
      ),
    );
  }
}

class PlaceholderImage extends StatelessWidget {
  const PlaceholderImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          margin: const EdgeInsets.all(24),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Image.asset('assets/placeholder.png', width: 100),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.cancel_rounded),
          color: Colors.grey[400],
          alignment: Alignment.topRight,
        ),
      ],
    );
  }
}

class Page6 extends StatefulWidget {
  const Page6({super.key});

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            'ADD PHOTOS OF YOUR BUSINESS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Business photos create your customer \'s first \n impression of your company. The best \n photos send a message to customers about \n the company \'s value, create brand loyalty, \n and sign a more professional appearance.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          const Text(
            'Upload header image for your business',
            style: TextStyle(fontSize: 13),
          ),
          const SizedBox(height: 6),
          const Text(
            '(Size: 540 x 540 Pixels)',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: 128,
            height: 40,
            child: ElevatedButton(
              onPressed: null,
              style: buttonTheme(
                color: const Color(0xFF5E86EC),
              ).copyWith(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5);
                    } else if (states.contains(MaterialState.disabled)) {
                      return const Color(0xFF9FBAFF);
                    }
                    return const Color(0xFF5E86EC);
                  },
                ),
              ),
              child: Text(
                'Upload Logo',
                style:
                    context.textTheme.titleSmall?.copyWith(color: Colors.white),
              ),
            ),
          ),
          const PlaceholderImage(),
        ],
      ),
    );
  }
}

class Page7 extends StatefulWidget {
  const Page7({super.key});

  @override
  State<Page7> createState() => _Page7State();
}

class _Page7State extends State<Page7> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            'ADD PHOTOS OF YOUR BUSINESS',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Business photos create your customer \'s first \n impression of your company. The best \n photos send a message to customers about \n the company \'s value, create brand loyalty, \n and sign a more professional appearance.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const Text('Upload business photos for your business website',
              style: TextStyle(fontSize: 12)),
          const Text(
            'Atleast 3 images (Size: 300 x 300 Pixels)',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(
            height: 18,
          ),
          SizedBox(
            width: 128,
            height: 40,
            child: ElevatedButton(
              onPressed: null,
              style: buttonTheme(
                color: const Color(0xFF5E86EC),
              ).copyWith(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) {
                      return Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.5);
                    } else if (states.contains(MaterialState.disabled)) {
                      return const Color(0xFF9FBAFF);
                    }
                    return const Color(0xFF5E86EC);
                  },
                ),
              ),
              child: Text(
                'Upload Logo',
                style:
                    context.textTheme.titleSmall?.copyWith(color: Colors.white),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                iconSize: 36,
                color: Colors.grey[300],
              ),
              const PlaceholderImage(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_rounded),
                iconSize: 36,
                color: Colors.grey[300],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Page8 extends StatefulWidget {
  const Page8({super.key});

  @override
  State<Page8> createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          const Text(
            'PUBLISH',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 96,
          ),
          const Text(
            'EASILY IN MINUTES',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Create a website for your business.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(
            height: 42,
          ),
          SizedBox(
            width: 160,
            height: 38,
            child: ElevatedButton(
              onPressed: () {
                context.navigate(const Page9());
              },
              style: buttonTheme(
                color: const Color(0xFF5E86EC),
              ),
              child: Text(
                'PUBLISH',
                style:
                    context.textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
