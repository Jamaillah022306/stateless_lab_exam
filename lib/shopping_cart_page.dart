import 'package:flutter/material.dart';

// ---------- Colors ----------
const Color kBlue = Color(0xFF800020);
const Color kLightBlue = Color(0xFFF7DEE3);
const Color kNavy = Color(0xFF2B0A12);
const Color kPageBg = Color(0xFFF0EEEF);
const Color kBorder = Color(0xFFE6DDE0);

// ---------- Main Page ----------
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  // Palitan ang name sa imong full name
  static const String studentName = 'Jamaillah Santi';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPageBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kNavy),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: const Text(
          'Shop Cart',
          style: TextStyle(
            color: kNavy,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined, color: kNavy),
                  onPressed: () => debugPrint('Cart clicked'),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: kBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----- Introduction Section -----
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: kLightBlue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'CAMPUS STORE',
                style: TextStyle(
                  color: kBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ready for checkout',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: kNavy,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Review your items before placing your order.',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 12),

            // ----- Delivery Information Card -----
            Container(
              padding: const EdgeInsets.all(14),
              decoration: _cardDecoration(),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: kBlue, size: 28),
                  const SizedBox(width: 12),
                  Container(width: 1, height: 36, color: kBorder),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Deliver to $studentName',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: kNavy,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Gem Village Ma-a, Davao City',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () => debugPrint('Change delivery address clicked'),
                    child: const Text(
                      'Change',
                      style: TextStyle(
                        color: kBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // ----- Order Items -----
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Items',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kNavy,
                  ),
                ),
                Text('3 items', style: TextStyle(color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 8),
            const CartItemCard(
              name: 'Wireless Mouse',
              price: 450.00,
              quantity: 1,
              icon: Icons.mouse_outlined,
            ),
            const CartItemCard(
              name: 'USB-C Hub',
              price: 850.00,
              quantity: 1,
              icon: Icons.usb,
            ),
            const CartItemCard(
              name: 'Laptop Stand',
              price: 700.00,
              quantity: 1,
              icon: Icons.laptop_mac,
            ),

            // ----- Discount Banner -----
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: kLightBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_offer_outlined, color: kBlue),
                  const SizedBox(width: 12),
                  Container(width: 1, height: 32, color: const Color(0x4D800020)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'STUDENT10 applied',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: kBlue,
                          ),
                        ),
                        Text(
                          '10% discount on items',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle, color: kBlue, size: 30),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // ----- Payment Summary -----
            Container(
              padding: const EdgeInsets.all(12),
              decoration: _cardDecoration(),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Summary',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kNavy,
                    ),
                  ),
                  SizedBox(height: 10),
                  SummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
                  SummaryRow(label: 'Discount (10%)', amount: '- PHP 200.00'),
                  SummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(height: 1, color: kBorder),
                  ),
                  SummaryRow(
                    label: 'Total',
                    amount: 'PHP 1,850.00',
                    isTotal: true,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // ----- Place Order Button -----
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () =>
                    debugPrint('Place order clicked! Total: PHP 1850.00'),
                icon: const Icon(Icons.lock),
                label: const Text(
                  'Place Order',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration() => BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: kBorder),
      boxShadow: const [
        BoxShadow(
          color: Color(0x12800020),
          blurRadius: 8,
          offset: Offset(0, 3),
        ),
      ],
    );

// ---------- Reusable Product Card ----------
class CartItemCard extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: _cardDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 32, color: kNavy),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: kNavy,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'PHP ${price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: kBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    _QtyButton(
                      icon: Icons.remove,
                      onTap: () => debugPrint('Decrease quantity: $name'),
                    ),
                    Container(
                      width: 44,
                      height: 28,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kBorder),
                      ),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kNavy,
                        ),
                      ),
                    ),
                    _QtyButton(
                      icon: Icons.add,
                      onTap: () => debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.black54),
            onPressed: () => debugPrint('Remove item: $name'),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 44,
        height: 28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kBlue, width: 1.5),
        ),
        child: Icon(icon, size: 20, color: kBlue),
      ),
    );
  }
}

// ---------- Summary Row ----------
class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: isTotal ? 20 : 16,
      fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
      color: kNavy,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(amount, style: style),
        ],
      ),
    );
  }
}