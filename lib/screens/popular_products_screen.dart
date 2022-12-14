import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:profertility/config/config.dart';
import 'package:profertility/screens/product_details_screen.dart';
import 'package:profertility/screens/widgets/primary_button.dart';

class PopularProductsScreen extends StatelessWidget {
  const PopularProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset("assets/images/arrow-left.png"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        titleSpacing: 0.0,
        centerTitle: false,
        title: const Text(
          "Popular Products",
          style: TextStyle(
              fontSize: 18,
              color: Color(0xff4d1a53),
              fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: TextButton(
              onPressed: () {
                showFilterBottomSheet(context);
              },
              child: Row(
                children: [
                  const Text(
                    "Filters",
                    style: TextStyle(
                      color: Color(0xff898989),
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Image.asset("assets/images/setting.png"),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "36 Total Products",
              style: TextStyle(color: Color(0xff00afa4)),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return ProductItem(
                    assetImage: index % 2 == 0
                        ? "assets/images/125-test.png"
                        : "assets/images/125-test.png",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
      ),
      context: context,
      builder: (context) {
        return const FilterBottomSheet(
          filters: ["Filter", "Sort"],
          childrens: [
            FilterSheet(),
            SortingFilter(),
          ],
        );
      },
    );
  }
}

class FilterBottomSheet extends StatefulWidget {
  final List<Widget> childrens;
  final List<String> filters;
  const FilterBottomSheet({
    super.key,
    required this.childrens,
    required this.filters,
  });

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet>
    with SingleTickerProviderStateMixin {
  late PageController controller;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8.0),
            Container(
              width: 50,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xffe5e5e5),
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(widget.filters.length, (index) {
                  return FilterItem(
                    filter: widget.filters[index],
                    isSelected: selectedIndex == index,
                    onClick: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      controller.animateToPage(index,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut);
                    },
                  );
                }),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16.0),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: widget.childrens,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: PrimaryButton(
                title: "Apply filters",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  final String filter;
  final bool isSelected;
  final VoidCallback onClick;
  const FilterItem({
    Key? key,
    required this.filter,
    required this.isSelected,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Text.rich(
        TextSpan(
          text: filter,
          style: const TextStyle(fontSize: 20.0, color: Colors.black),
          children: [
            if (isSelected)
              WidgetSpan(
                alignment: PlaceholderAlignment.top,
                child: Row(
                  children: [
                    const SizedBox(width: 4.0),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  double price = 20.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Price range",
            ),
            Text(
              "\$20-\$1600",
            ),
          ],
        ),
        Slider(
          value: price,
          label: price.round().toString(),
          max: 1600,
          min: 20,
          divisions: 20,
          activeColor: const Color.fromRGBO(247, 248, 250, 1),
          inactiveColor: const Color.fromRGBO(247, 248, 250, 1),
          thumbColor: Theme.of(context).primaryColor,
          onChanged: (v) {
            setState(() {
              price = v;
            });
          },
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 56,
          child: DropdownButtonFormField(
            icon: Image.asset("assets/images/Polygon.png"),
            hint: const Text("Select Category"),
            decoration: const InputDecoration(
              hintText: "Select Category",
              contentPadding: EdgeInsets.all(20),
            ),
            items: const [
              DropdownMenuItem(
                value: "c",
                child: Text("Capsules"),
              ),
              DropdownMenuItem(
                value: "P",
                child: Text("Capsules"),
              ),
            ],
            onChanged: (v) {},
          ),
        ),
        const SizedBox(height: 16.0),
        SizedBox(
          height: 56,
          child: DropdownButtonFormField(
            icon: Image.asset("assets/images/Polygon.png"),
            hint: const Text("Select Brand"),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(20),
              hintText: "Select Category",
            ),
            items: const [
              DropdownMenuItem(
                value: "c",
                child: Text("Capsules"),
              ),
              DropdownMenuItem(
                value: "P",
                child: Text("Capsules"),
              ),
            ],
            onChanged: (v) {},
          ),
        ),
      ],
    );
  }
}

class SortingFilter extends StatefulWidget {
  const SortingFilter({super.key});

  @override
  State<SortingFilter> createState() => _SortingFilterState();
}

class _SortingFilterState extends State<SortingFilter> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 24.0,
      children: List.generate(
        Config.sortingFilters.length,
        (index) {
          final filter = Config.sortingFilters[index];
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Row(
              children: [
                Image.asset(
                  index == selectedIndex
                      ? "assets/images/male.png"
                      : "assets/images/female.png",
                ),
                const SizedBox(width: 24.0),
                Text(filter)
              ],
            ),
          );
        },
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final String assetImage;
  const ProductItem({
    Key? key,
    required this.assetImage,
  }) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ProductDetailsScreen(),
          ),
        );
      },
      child: AspectRatio(
        aspectRatio: 0.8,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xfff3f4f5),
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: const Color(0xfff5f7fd),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      widget.assetImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Fertility & Wellness test",
                        style: TextStyle(
                          color: Color(0xff1d1d1d),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            text: "\$35",
                            style: GoogleFonts.comfortaa().copyWith(
                              color: Theme.of(context).primaryColor,
                            ),
                            children: [
                              const WidgetSpan(
                                child: SizedBox(
                                  width: 6.0,
                                ),
                              ),
                              TextSpan(
                                text: "\$76",
                                style: GoogleFonts.comfortaa().copyWith(
                                  color: const Color(0xff898989),
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
