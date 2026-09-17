import 'package:flutter/material.dart';

void main() {
  runApp(const MealMapApp());
}

// =====================================================
// COLORS
// =====================================================

const Color orange = Color(0xFFFF8A00);
const Color green = Color(0xFF78B84A);
const Color darkGreen = Color(0xFF64C73B);
const Color cream = Color(0xFFFFF9F1);
const Color dark = Color(0xFF252525);
const Color grey = Color(0xFF5E3434);
const Color lightGrey = Color(0xFFF3F3F3);
const Color red = Color(0xFFE95C5C);

// =====================================================
// APP
// =====================================================

class MealMapApp extends StatelessWidget {
  const MealMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Map',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: cream,
        colorScheme: ColorScheme.fromSeed(seedColor: orange),
        fontFamily: 'Arial',
      ),
      home: const SplashPage(),
    );
  }
}

// =====================================================
// SPLASH
// =====================================================

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [orange, Color(0xFFFFB84D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.15),
                      blurRadius: 25,
                      offset: const Offset(0, 10),
                    )
                  ],
                ),
                child: Image.asset(
                  'assets/mealmap_logo.png',
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) {
                    return const Icon(
                      Icons.restaurant_menu,
                      size: 60,
                      color: orange,
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'Meal Map',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Better Nutrition. Better Health.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// LOGO
// =====================================================

class MealMapLogo extends StatelessWidget {
  final double size;

  const MealMapLogo({
    super.key,
    this.size = 55,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/mealmap_logo.png',
          width: size,
          height: size,
          errorBuilder: (_, __, ___) {
            return Icon(
              Icons.restaurant_menu,
              color: orange,
              size: size,
            );
          },
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Meal Map',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: orange,
              ),
            ),
            Text(
              'Better Nutrition',
              style: TextStyle(
                fontSize: 11,
                color: green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// =====================================================
// LOGIN
// =====================================================

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Center(child: MealMapLogo(size: 65)),
              const SizedBox(height: 55),

              const Text(
                'Welcome Back 👋',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: dark,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Sign in to continue your personalized meal journey.',
                style: TextStyle(color: grey),
              ),

              const SizedBox(height: 35),

              _input(
                controller: email,
                label: 'Email Address',
                icon: Icons.email_outlined,
              ),

              const SizedBox(height: 18),

              _input(
                controller: password,
                label: 'Password',
                icon: Icons.lock_outline,
                obscure: true,
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: orange),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              _primaryButton(
                text: 'Login',
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MainNavigation(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey.shade300)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 20),

              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.person_outline),
                label: const Text('Continue as Guest'),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 55),
                  side: const BorderSide(color: orange),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const SignupPage(),
                      ),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: grey),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: orange,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =====================================================
// SIGNUP
// =====================================================

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        backgroundColor: cream,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const MealMapLogo(size: 60),
            const SizedBox(height: 30),

            _input(
              label: 'Full Name',
              icon: Icons.person_outline,
            ),

            const SizedBox(height: 16),

            _input(
              label: 'Email',
              icon: Icons.email_outlined,
            ),

            const SizedBox(height: 16),

            _input(
              label: 'Password',
              icon: Icons.lock_outline,
              obscure: true,
            ),

            const SizedBox(height: 16),

            _input(
              label: 'Confirm Password',
              icon: Icons.lock_reset,
              obscure: true,
            ),

            const SizedBox(height: 30),

            _primaryButton(
              text: 'Create Account',
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MainNavigation(),
                  ),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// MAIN NAVIGATION
// =====================================================

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final pages = const [
    HomePage(),
    SearchPage(),
    PlansPage(),
    TrackingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        indicatorColor: orange.withOpacity(.15),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: orange),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.search, color: orange),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.restaurant_menu),
            selectedIcon: Icon(Icons.restaurant, color: orange),
            label: 'Plans',
          ),
          NavigationDestination(
            icon: Icon(Icons.insights_outlined),
            selectedIcon: Icon(Icons.insights, color: orange),
            label: 'Track',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: orange),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// =====================================================
// HOME
// =====================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning 👋',
                        style: TextStyle(
                          color: grey,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Find your perfect meal',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: orange.withOpacity(.15),
                  child: const Icon(
                    Icons.notifications_none,
                    color: orange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // SEARCH
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: orange),
                  hintText: 'What are you craving?',
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // HEALTH BANNER
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [green, darkGreen],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Better Nutrition.\nBetter Health.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Discover meals designed around your needs.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.health_and_safety,
                    size: 65,
                    color: Colors.white,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const _SectionTitle(
              title: 'Health Conditions',
              action: 'View all',
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 115,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _conditionCard(
                    context,
                    'Diabetes',
                    Icons.bloodtype_outlined,
                    orange,
                  ),
                  _conditionCard(
                    context,
                    'Kidney Care',
                    Icons.local_hospital_outlined,
                    green,
                  ),
                  _conditionCard(
                    context,
                    'Heart Health',
                    Icons.favorite_border,
                    red,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const _SectionTitle(
              title: 'Recommended Meals',
              action: 'See all',
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                Expanded(
                  child: _mealCard(
                    context,
                    'Healthy Rice Bowl',
                    'assets/meal1.png',
                    '\$8.99',
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: _mealCard(
                    context,
                    'Fresh Meal',
                    'assets/meal1.png',
                    '\$7.50',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            const _SectionTitle(
              title: 'Local & Cultural Meals',
              action: 'Explore',
            ),

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFFFFF0D8),
                    child: Text(
                      '🍚',
                      style: TextStyle(fontSize: 28),
                    ),
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Culturally Familiar Food',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Meals based on local ingredients and food preferences.',
                          style: TextStyle(
                            color: grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: orange,
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

// =====================================================
// SEARCH
// =====================================================

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Search Meals',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: orange),
                  hintText: 'Search meal, ingredient or category',
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Popular Categories',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _chip('Low Sugar'),
                _chip('Heart Healthy'),
                _chip('Low Sodium'),
                _chip('Vegetarian'),
                _chip('Local Food'),
                _chip('High Protein'),
              ],
            ),

            const SizedBox(height: 30),

            const Text(
              'Popular Meals',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            _searchMeal('Healthy Rice Bowl', '\$8.99'),
            _searchMeal('Vegetable Plate', '\$7.99'),
            _searchMeal('Chicken & Vegetables', '\$10.50'),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// PLANS
// =====================================================

class PlansPage extends StatelessWidget {
  const PlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Meal Plans',
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Explore clinician-designed meal plans.',
              style: TextStyle(color: grey),
            ),

            const SizedBox(height: 25),

            _planCard(
              context,
              'Diabetes Care',
              'Meal planning support for people managing diabetes.',
              Icons.bloodtype_outlined,
              orange,
            ),

            _planCard(
              context,
              'Chronic Kidney Disease',
              'Nutrition planning based on an approved care plan.',
              Icons.local_hospital_outlined,
              green,
            ),

            _planCard(
              context,
              'Heart Failure',
              'Heart-health focused meal planning support.',
              Icons.favorite_border,
              red,
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(.08),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: orange.withOpacity(.2),
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.info_outline, color: orange),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Meal plans should be reviewed according to your healthcare provider or dietitian guidance.',
                      style: TextStyle(
                        color: dark,
                        fontSize: 12,
                      ),
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

// =====================================================
// WORKFLOW
// =====================================================

class WorkflowPage extends StatelessWidget {
  const WorkflowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [
      ['Patient', Icons.person],
      ['Healthcare Provider', Icons.medical_services],
      ['Insurer / Payer', Icons.account_balance],
      ['Meal Service', Icons.restaurant],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurer Workflow'),
        backgroundColor: cream,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: orange.withOpacity(.12),
                      child: Icon(
                        steps[index][1] as IconData,
                        color: orange,
                      ),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Text(
                        steps[index][0] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: green,
                    ),
                  ],
                ),
              ),
              if (index != steps.length - 1)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: orange,
                    size: 30,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

// =====================================================
// TRACKING
// =====================================================

class TrackingPage extends StatelessWidget {
  const TrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Adherence Tracking',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Track your meal-plan participation.',
              style: TextStyle(color: grey),
            ),

            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [orange, Color(0xFFFFB13B)],
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Column(
                children: [
                  Text(
                    'Weekly Adherence',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    '82%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Great progress!',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'This Week',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            ...List.generate(
              7,
                  (index) => _trackingDay(
                ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
                index < 5,
              ),
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.insights,
                    color: green,
                    size: 35,
                  ),
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      'Your care team can review adherence progress and identify where additional support may be useful.',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
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

// =====================================================
// PROFILE
// =====================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 15),

            const CircleAvatar(
              radius: 48,
              backgroundColor: Color(0xFFFFE7C4),
              child: Icon(
                Icons.person,
                size: 55,
                color: orange,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Meal Map User',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              'user@mealmap.com',
              style: TextStyle(color: grey),
            ),

            const SizedBox(height: 30),

            _profileItem(
              Icons.person_outline,
              'Personal Information',
            ),

            _profileItem(
              Icons.health_and_safety_outlined,
              'Health Preferences',
            ),

            _profileItem(
              Icons.language,
              'Language & Culture',
            ),

            _profileItem(
              Icons.notifications_none,
              'Notifications',
            ),

            _profileItem(
              Icons.settings_outlined,
              'Settings',
            ),

            _profileItem(
              Icons.help_outline,
              'Help & Support',
            ),

            const SizedBox(height: 20),

            OutlinedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginPage(),
                  ),
                      (route) => false,
                );
              },
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 52),
                foregroundColor: red,
                side: const BorderSide(color: red),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// MEAL DETAILS
// =====================================================

class MealDetailsPage extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  const MealDetailsPage({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Details'),
        backgroundColor: cream,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                image,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    height: 250,
                    color: lightGrey,
                    child: const Center(
                      child: Icon(
                        Icons.restaurant,
                        size: 70,
                        color: orange,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: orange,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            const Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 5),
                Text(
                  '4.8',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Healthy Choice',
                  style: TextStyle(color: green),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'About this meal',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'A balanced meal option prepared with fresh ingredients. '
                  'Meal suitability should be considered according to the '
                  'user’s approved meal plan and healthcare guidance.',
              style: TextStyle(
                color: grey,
                height: 1.6,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _chip('Rice'),
                _chip('Vegetables'),
                _chip('Protein'),
                _chip('Fresh Herbs'),
              ],
            ),

            const SizedBox(height: 30),

            _primaryButton(
              text: 'Add to Meal Plan',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Meal added to your plan'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// REUSABLE WIDGETS
// =====================================================

Widget _input({
  TextEditingController? controller,
  required String label,
  required IconData icon,
  bool obscure = false,
}) {
  return TextField(
    controller: controller,
    obscureText: obscure,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: orange),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: orange,
          width: 1.5,
        ),
      ),
    ),
  );
}

Widget _primaryButton({
  required String text,
  required VoidCallback onTap,
}) {
  return SizedBox(
    width: double.infinity,
    height: 55,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: orange,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String action;

  const _SectionTitle({
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          action,
          style: const TextStyle(
            color: orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

Widget _conditionCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    ) {
  return Container(
    width: 125,
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.04),
          blurRadius: 12,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 21,
          backgroundColor: color.withOpacity(.12),
          child: Icon(icon, color: color),
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
          ),
        ),
      ],
    ),
  );
}

Widget _mealCard(
    BuildContext context,
    String name,
    String image,
    String price,
    ) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => MealDetailsPage(
            name: name,
            image: image,
            price: price,
          ),
        ),
      );
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            child: Image.asset(
              image,
              height: 130,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  height: 130,
                  color: lightGrey,
                  child: const Center(
                    child: Icon(
                      Icons.restaurant,
                      color: orange,
                      size: 45,
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '4.8',
                      style: TextStyle(fontSize: 12),
                    ),
                    const Spacer(),
                    Text(
                      price,
                      style: const TextStyle(
                        color: orange,
                        fontWeight: FontWeight.bold,
                      ),
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

Widget _planCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    Color color,
    ) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.05),
          blurRadius: 15,
        ),
      ],
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color.withOpacity(.12),
          child: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                description,
                style: const TextStyle(
                  color: grey,
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'View Plan →',
                style: TextStyle(
                  color: orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _trackingDay(String day, bool completed) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    padding: const EdgeInsets.symmetric(
      horizontal: 18,
      vertical: 15,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 45,
          child: Text(
            day,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: LinearProgressIndicator(
            value: completed ? 1 : .25,
            minHeight: 7,
            borderRadius: BorderRadius.circular(10),
            backgroundColor: Colors.grey.shade200,
            color: completed ? green : orange,
          ),
        ),
        const SizedBox(width: 15),
        Icon(
          completed ? Icons.check_circle : Icons.pending,
          color: completed ? green : orange,
        ),
      ],
    ),
  );
}

Widget _profileItem(IconData icon, String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(17),
    ),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: orange.withOpacity(.1),
        child: Icon(icon, color: orange),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: grey,
      ),
    ),
  );
}

Widget _chip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 9,
    ),
    decoration: BoxDecoration(
      color: orange.withOpacity(.1),
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: orange,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

Widget _searchMeal(String title, String price) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            'assets/meal1.png',
            width: 75,
            height: 75,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Container(
                width: 75,
                height: 75,
                color: lightGrey,
                child: const Icon(
                  Icons.restaurant,
                  color: orange,
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Healthy • Fresh • Local',
                style: TextStyle(
                  color: grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Text(
          price,
          style: const TextStyle(
            color: orange,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}