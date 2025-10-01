import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mylekha_cd_app/screens/routes/route_names.dart';
import 'package:mylekha_cd_app/widgets/Text/title_md_widget.dart';
import 'package:mylekha_cd_app/widgets/buttons/btn_logout_outline_widget.dart';
import 'package:mylekha_cd_app/widgets/buttons/btn_secondary_widget.dart';
import 'package:mylekha_cd_app/widgets/form/custom_select_field_widget.dart';

// 1. Define the generic type (T) for the widget
class Store {
  final int id;
  final String name;
  final String location;

  const Store(this.id, this.name, this.location);

  // We override toString() for easy debugging, although itemAsString is used for display.
  @override
  String toString() => name;
}

class SelectedDevice extends StatefulWidget {
  const SelectedDevice({super.key});

  @override
  State<SelectedDevice> createState() => _SelectedDeviceState();
}

class _SelectedDeviceState extends State<SelectedDevice> {
  final List<Store> availableStores = const [
    Store(101, 'Main Street Emporium', 'New York'),
    Store(102, 'Bay Area Outlet', 'California'),
    Store(103, 'Chicago Hub', 'Illinois'),
    Store(104, 'Miami Beach Store', 'Florida'),
    Store(105, 'Seattle Flagship', 'Washington'),
  ];

  final List<Store> availableDevices = const [
    Store(201, 'iPhone 15 Pro', 'Smartphone'),
    Store(202, 'Samsung Galaxy S24', 'Smartphone'),
    Store(203, 'MacBook Pro 16"', 'Laptop'),
    Store(204, 'Dell XPS 15', 'Laptop'),
    Store(205, 'iPad Pro 12.9"', 'Tablet'),
    Store(206, 'Surface Pro 9', 'Tablet'),
    Store(207, 'Apple Watch Series 10', 'Smartwatch'),
    Store(208, 'Samsung Galaxy Watch 7', 'Smartwatch'),
    Store(209, 'PlayStation 5', 'Gaming Console'),
    Store(210, 'Xbox Series X', 'Gaming Console'),
  ];

  // State variable to hold the selected store
  Store? _selectedStore;
  Store? _selectedDevice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleMdWidget(text: 'Please select device'),
                  SizedBox(height: 20),
                  CustomSelectFieldWidget<Store>(
                    label: 'Store',
                    items: availableStores,
                    selectedItem: _selectedStore,
                    itemAsString: (Store? store) =>
                        store?.name ?? 'Select a Store',

                    // Update the state when a new item is selected
                    onChanged: (Store? newStore) {
                      setState(() {
                        _selectedStore = newStore;
                      });
                    },

                    // Optional: Add validation logic
                    validator: (Store? store) {
                      if (store == null) {
                        return 'Please select a store.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  CustomSelectFieldWidget<Store>(
                    label: 'Device',
                    icon: Icon(Icons.devices_outlined),
                    items: availableDevices,
                    selectedItem: _selectedDevice,
                    itemAsString: (Store? device) =>
                        device?.name ?? 'Select a device',

                    // Update the state when a new item is selected
                    onChanged: (Store? newDevice) {
                      setState(() {
                        _selectedDevice = newDevice;
                      });
                    },

                    // Optional: Add validation logic
                    validator: (Store? device) {
                      if (device == null) {
                        return 'Please select a device.';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BtnLogoutOutlineWidget(text: 'Logout', onPressed: () {}),
                      BtnSecondaryWidget(
                        text: 'Confirm',
                        onPressed: () {
                          GoRouter.of(context).go(RouteNames.HOME_PATH);
                        },
                      ),
                    ],
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
