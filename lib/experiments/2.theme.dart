// https://chat.deepseek.com/a/chat/s/bb2c4993-f932-40df-ac86-ac20082fe2a3


import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const ThemeLearningLab());

class ThemeLearningLab extends StatefulWidget {
  const ThemeLearningLab({super.key});

  @override
  State<ThemeLearningLab> createState() => _ThemeLearningLabState();
}

class _ThemeLearningLabState extends State<ThemeLearningLab> {
  ThemeMode _themeMode = ThemeMode.system;
  Color _seedColor = Colors.deepPurple;
  bool _useMaterial3 = true;
  double _fontScale = 1.0;
  double _borderRadius = 12.0;
  double _elevation = 4.0;

  // Data untuk theme explorer
  final List<Map<String, dynamic>> _themeProperties = [
    {
      'title': 'Color Scheme',
      'properties': [
        'primary',
        'secondary',
        'tertiary',
        'surface',
        'background',
        'error',
        'primaryContainer',
        'secondaryContainer'
      ]
    },
    {
      'title': 'Text Theme',
      'properties': ['headlineLarge', 'bodyLarge', 'labelLarge', 'titleMedium']
    },
    {
      'title': 'Shape & Effects',
      'properties': ['borderRadius', 'elevation', 'shadows']
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Learning Lab',
      
      // Tema dinamis berdasarkan state
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: _themeMode,
      
      home: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          return Scaffold(
            body: _buildHomePage(context, theme),
            floatingActionButton: _buildThemeControls(context),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }

  // ========== TEMA DINAMIS ==========
  ThemeData _buildLightTheme() {
    return ThemeData(
      useMaterial3: _useMaterial3,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.light,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _seedColor,
        elevation: _elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(_borderRadius),
            bottomRight: Radius.circular(_borderRadius),
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 96.0 * _fontScale,
          fontWeight: FontWeight.w300,
          color: _seedColor,
        ),
        headlineLarge: TextStyle(
          fontSize: 60.0 * _fontScale,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0 * _fontScale,
          height: 1.5,
        ),
        labelLarge: TextStyle(
          fontSize: 14.0 * _fontScale,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          elevation: _elevation,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      cardTheme: CardThemeData(
        elevation: _elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        margin: const EdgeInsets.all(8),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        filled: true,
        fillColor: Colors.grey[50],
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius * 2),
        ),
      ),
    );
  }

  ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: _useMaterial3,
      colorScheme: ColorScheme.fromSeed(
        seedColor: _seedColor,
        brightness: Brightness.dark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[900],
        elevation: _elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(_borderRadius),
            bottomRight: Radius.circular(_borderRadius),
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 96.0 * _fontScale,
          fontWeight: FontWeight.w300,
          color: _seedColor,
        ),
        headlineLarge: TextStyle(
          fontSize: 60.0 * _fontScale,
          fontWeight: FontWeight.w700,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.0 * _fontScale,
          height: 1.5,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          elevation: _elevation,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: _elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        color: Colors.grey[900],
      ),
    );
  }

  // ========== HALAMAN UTAMA ==========
  Widget _buildHomePage(BuildContext context, ThemeData theme) {
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;
    final isDark = theme.brightness == Brightness.dark;

    return CustomScrollView(
      slivers: [
        // App Bar dengan kontrol tema
        SliverAppBar(
          expandedHeight: 200,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Theme Learning Lab',
              style: textTheme.titleLarge?.copyWith(
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            background: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    _seedColor,
                    _seedColor.withOpacity(0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.color_lens,
                  size: 80,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          ),
        ),

        // Konten utama
        SliverList(
          delegate: SliverChildListDelegate([
            // Section 1: Theme Preview
            _buildSection(
              title: '🎨 Theme Preview',
              child: _buildThemePreview(context, colors, textTheme),
            ),

            // Section 2: Color Explorer
            _buildSection(
              title: '🌈 Color Explorer',
              child: _buildColorExplorer(colors),
            ),

            // Section 3: Component Showcase
            _buildSection(
              title: '🛠 Component Showcase',
              child: _buildComponentShowcase(context, theme, colors),
            ),

            // Section 4: Theme Properties
            _buildSection(
              title: '🔧 Theme Properties',
              child: _buildThemeProperties(theme, colors),
            ),

            // Section 5: Typography Scale
            _buildSection(
              title: '🔤 Typography Scale',
              child: _buildTypographyScale(textTheme),
            ),

            // Section 6: Current Theme Info
            _buildSection(
              title: '📊 Current Theme Info',
              child: _buildThemeInfo(isDark),
            ),
          ]),
        ),
      ],
    );
  }

  // ========== KOMPONEN UI ==========
  Widget _buildSection({required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: child,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildThemePreview(BuildContext context, ColorScheme colors, TextTheme textTheme) {
    return Column(
      children: [
        // Warna utama dalam gradient
        Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colors.primary,
                colors.secondary,
                colors.tertiary ?? colors.primary,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              'Primary Gradient',
              style: textTheme.titleLarge?.copyWith(
                color: colors.onPrimary,
                shadows: [
                  Shadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 2,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        
        // Warna surface dan background
        Row(
          children: [
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: colors.outline),
                ),
                child: Center(
                  child: Text(
                    'Surface',
                    style: TextStyle(color: colors.onSurface),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: colors.background,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: colors.outline),
                ),
                child: Center(
                  child: Text(
                    'Background',
                    style: TextStyle(color: colors.onBackground),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildColorExplorer(ColorScheme colors) {
    final colorPairs = [
      {'name': 'Primary', 'color': colors.primary, 'onColor': colors.onPrimary},
      {'name': 'Secondary', 'color': colors.secondary, 'onColor': colors.onSecondary},
      {'name': 'Tertiary', 'color': colors.tertiary ?? colors.primary, 'onColor': colors.onTertiary},
      {'name': 'Error', 'color': colors.error, 'onColor': colors.onError},
      {'name': 'Surface', 'color': colors.surface, 'onColor': colors.onSurface},
      {'name': 'Background', 'color': colors.background, 'onColor': colors.onBackground},
    ];

    return Column(
      children: colorPairs.map((pair) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Container(
                width: 80,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: pair['color'] as Color,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Text(
                  pair['name'] as String,
                  style: TextStyle(
                    color: pair['onColor'] as Color,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pair['name'] as String,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      (pair['color'] as Color).value.toRadixString(16).toUpperCase(),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: pair['color'] as Color,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300]!),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildComponentShowcase(BuildContext context, ThemeData theme, ColorScheme colors) {
    return Column(
      children: [
        // Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton(
              onPressed: () => _showSnackbar(context, 'Elevated Button'),
              child: const Text('Elevated'),
            ),
            FilledButton(
              onPressed: () => _showSnackbar(context, 'Filled Button'),
              child: const Text('Filled'),
            ),
            OutlinedButton(
              onPressed: () => _showSnackbar(context, 'Outlined Button'),
              child: const Text('Outlined'),
            ),
            IconButton(
              onPressed: () => _showSnackbar(context, 'Icon Button'),
              icon: const Icon(Icons.favorite),
              style: IconButton.styleFrom(
                backgroundColor: colors.primaryContainer,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        
        // Input Fields
        Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Text Field',
                prefixIcon: const Icon(Icons.text_fields),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              decoration: InputDecoration(
                labelText: 'Search Field',
                prefixIcon: const Icon(Icons.search),
                filled: true,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        
        // Cards & Chips
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Card', style: theme.textTheme.titleMedium),
                    const Text('Contoh kartu dengan tema'),
                  ],
                ),
              ),
            ),
            Card(
              color: colors.primaryContainer,
              child: const Padding(
                padding: EdgeInsets.all(12),
                child: Text('Card Berwarna'),
              ),
            ),
            Chip(
              label: const Text('Chip 1'),
              avatar: const CircleAvatar(
                radius: 12,
                child: Icon(Icons.tag, size: 12),
              ),
            ),
            InputChip(
              label: const Text('Input Chip'),
              onPressed: () {},
            ),
            FilterChip(
              label: const Text('Filter Chip'),
              selected: true,
              onSelected: (_) {},
            ),
          ],
        ),
        
        // Progress Indicators
        const SizedBox(height: 20),
        LinearProgressIndicator(
          value: 0.7,
          backgroundColor: colors.surfaceVariant,
          color: colors.primary,
        ),
        const SizedBox(height: 8),
        CircularProgressIndicator(
          value: 0.7,
          backgroundColor: colors.surfaceVariant,
          color: colors.primary,
        ),
      ],
    );
  }

  Widget _buildThemeProperties(ThemeData theme, ColorScheme colors) {
    return Column(
      children: _themeProperties.map((section) {
        return ExpansionTile(
          title: Text(
            section['title'] as String,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          children: (section['properties'] as List).map((property) {
            return ListTile(
              title: Text(property),
              trailing: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _getPropertyColor(property, colors),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
              ),
              subtitle: Text(
                _getPropertyValue(property, theme, colors),
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildTypographyScale(TextTheme textTheme) {
    final textStyles = [
      {'name': 'Display Large', 'style': textTheme.displayLarge},
      {'name': 'Headline Large', 'style': textTheme.headlineLarge},
      {'name': 'Title Large', 'style': textTheme.titleLarge},
      {'name': 'Body Large', 'style': textTheme.bodyLarge},
      {'name': 'Label Large', 'style': textTheme.labelLarge},
      {'name': 'Body Small', 'style': textTheme.bodySmall},
    ];

    return Column(
      children: textStyles.map((style) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  style['name'] as String,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'The quick brown fox jumps over the lazy dog',
                  style: style['style'] as TextStyle?,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildThemeInfo(bool isDark) {
    return Column(
      children: [
        InfoRow(label: 'Theme Mode', value: _themeMode.toString().split('.').last),
        InfoRow(label: 'Material 3', value: _useMaterial3 ? 'Enabled' : 'Disabled'),
        InfoRow(label: 'Seed Color', value: '#${_seedColor.value.toRadixString(16).padLeft(8, '0').toUpperCase()}'),
        InfoRow(label: 'Brightness', value: isDark ? 'Dark' : 'Light'),
        InfoRow(label: 'Font Scale', value: '${_fontScale.toStringAsFixed(1)}x'),
        InfoRow(label: 'Border Radius', value: '${_borderRadius.toStringAsFixed(0)}px'),
        InfoRow(label: 'Elevation', value: '${_elevation.toStringAsFixed(0)}dp'),
      ],
    );
  }

  Widget _buildThemeControls(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Row 1: Theme Mode & Material 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildControlButton(
                icon: Icons.light_mode,
                label: 'Light',
                active: _themeMode == ThemeMode.light,
                onTap: () => setState(() => _themeMode = ThemeMode.light),
              ),
              _buildControlButton(
                icon: Icons.dark_mode,
                label: 'Dark',
                active: _themeMode == ThemeMode.dark,
                onTap: () => setState(() => _themeMode = ThemeMode.dark),
              ),
              _buildControlButton(
                icon: Icons.settings_suggest,
                label: 'System',
                active: _themeMode == ThemeMode.system,
                onTap: () => setState(() => _themeMode = ThemeMode.system),
              ),
              _buildControlButton(
                icon: Icons.auto_awesome,
                label: 'M3',
                active: _useMaterial3,
                onTap: () => setState(() => _useMaterial3 = !_useMaterial3),
              ),
            ],
          ),
          
          // Row 2: Color Picker
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ..._buildColorButtons(),
                IconButton(
                  icon: const Icon(Icons.shuffle),
                  onPressed: _randomizeColors,
                  tooltip: 'Randomize Colors',
                ),
              ],
            ),
          ),
          
          // Row 3: Sliders
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.text_increase, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Slider(
                      value: _fontScale,
                      min: 0.5,
                      max: 2.0,
                      divisions: 15,
                      label: 'Font Scale: ${_fontScale.toStringAsFixed(1)}x',
                      onChanged: (value) => setState(() => _fontScale = value),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.crop_square, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Slider(
                      value: _borderRadius,
                      min: 0,
                      max: 24,
                      divisions: 24,
                      label: 'Border Radius: ${_borderRadius.toInt()}px',
                      onChanged: (value) => setState(() => _borderRadius = value),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.layers, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Slider(
                      value: _elevation,
                      min: 0,
                      max: 24,
                      divisions: 12,
                      label: 'Elevation: ${_elevation.toInt()}dp',
                      onChanged: (value) => setState(() => _elevation = value),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildColorButtons() {
    final colors = [
      Colors.deepPurple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.pink,
      Colors.teal,
      Colors.indigo,
      Colors.red,
    ];

    return colors.map((color) {
      return GestureDetector(
        onTap: () => setState(() => _seedColor = color),
        child: Container(
          width: 32,
          height: 32,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: _seedColor == color ? Colors.white : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required bool active,
    required VoidCallback onTap,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(icon),
          color: active ? _seedColor : Colors.grey,
          onPressed: onTap,
          style: IconButton.styleFrom(
            backgroundColor: active ? _seedColor.withOpacity(0.1) : null,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: active ? _seedColor : Colors.grey,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  // ========== HELPER METHODS ==========
  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
      ),
    );
  }

  void _randomizeColors() {
    final random = Random();
    setState(() {
      _seedColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }

  Color? _getPropertyColor(String property, ColorScheme colors) {
    switch (property) {
      case 'primary':
        return colors.primary;
      case 'secondary':
        return colors.secondary;
      case 'tertiary':
        return colors.tertiary;
      case 'surface':
        return colors.surface;
      case 'background':
        return colors.background;
      case 'error':
        return colors.error;
      case 'primaryContainer':
        return colors.primaryContainer;
      case 'secondaryContainer':
        return colors.secondaryContainer;
      default:
        return null;
    }
  }

  String _getPropertyValue(String property, ThemeData theme, ColorScheme colors) {
    switch (property) {
      case 'borderRadius':
        return '${_borderRadius.toInt()}px';
      case 'elevation':
        return '${_elevation.toInt()}dp';
      case 'shadows':
        return 'Soft & Customizable';
      default:
        final color = _getPropertyColor(property, colors);
        return color != null 
            ? '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}'
            : 'N/A';
    }
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              value,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}