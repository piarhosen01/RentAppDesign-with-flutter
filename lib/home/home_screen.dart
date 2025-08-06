import 'package:flutter/material.dart';
import 'package:homerentapp/util/app_colors.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolors.background,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              _buildSearchBar(),
              const SizedBox(height: 16),
              SizedBox(height: 56, child: _buildCategoryTabs()),
              const SizedBox(height: 24),
              _buildSectionHeader('Near from you'),
              const SizedBox(height: 16),
              SizedBox(height: 240, child: _buildNearbyHotels()),
              const SizedBox(height: 32),
              _buildSectionHeader('Best for you'),
              const SizedBox(height: 16),
              _buildBestForYouList(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: appcolors.background,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(
                color: appcolors.offwhite,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Text(
                  'Jakarta',
                  style: TextStyle(
                    color: appcolors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.keyboard_arrow_down_outlined, color: appcolors.offwhite),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Image.asset('assets/icons/ic_notification.png', height: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'search address or near you',
              filled: true,
              fillColor: appcolors.lightgrey,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
            ),
          ),
        ),
        const SizedBox(width: 12),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            'assets/icons/ic_filter.png',
            height: 48,
            width: 48,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    final categories = ['House', 'Apartment', 'Hotel', 'Villa', 'Restaurant'];
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      separatorBuilder: (_, __) => const SizedBox(width: 12),
      itemBuilder: (_, index) => _CategoryTab(
        label: categories[index],
        isSelected: index == 0,
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: appcolors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'See more',
          style: TextStyle(
            color: appcolors.offwhite,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildNearbyHotels() {
    final hotels = [
      _HotelData('hotel1.png', 'Sunset Resort', 'Jl. Sudirman', '1.8 km'),
      _HotelData('hotel2.png', 'Palm Springs', 'Jl. Thamrin', '2.3 km'),
      _HotelData('hotel3.png', 'Ocean View', 'Jl. Gatot Subroto', '3.1 km'),
    ];

    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: hotels.length,
      separatorBuilder: (_, __) => const SizedBox(width: 16),
      itemBuilder: (_, index) => _HotelCard(hotel: hotels[index]),
    );
  }

  Widget _buildBestForYouList() {
    final hotels = [
      _BestHotelData('hotel1.png', 'Grand Palace', '200/night', 2, 1),
      _BestHotelData('hotel2.png', 'City Lights', '250/night', 3, 2),
      _BestHotelData('hotel3.png', 'Urban Stay', '220/night', 2, 2),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: hotels.length,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (_, index) => _BestHotelCard(hotel: hotels[index]),
    );
  }
}

class _CategoryTab extends StatelessWidget {
  final String label;
  final bool isSelected;

  const _CategoryTab({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? appcolors.primary : appcolors.lightgrey,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isSelected ? [
          BoxShadow(
            color: appcolors.primary.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ] : null,
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.white : appcolors.offwhite,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}

class _HotelData {
  final String image;
  final String name;
  final String location;
  final String distance;

  const _HotelData(this.image, this.name, this.location, this.distance);
}

class _HotelCard extends StatelessWidget {
  final _HotelData hotel;

  const _HotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/${hotel.image}',
            height: 220,
            width: 180,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 16,
            right: 16,
            child: _buildDistanceTag(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _buildHotelInfo(),
          ),
        ],
      ),
    );
  }

  Widget _buildDistanceTag() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.location_on, color: Colors.white, size: 16),
          const SizedBox(width: 4),
          Text(
            hotel.distance,
            style: const TextStyle(color: Colors.white, fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.6),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            hotel.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            hotel.location,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _BestHotelData {
  final String image;
  final String name;
  final String price;
  final int bedrooms;
  final int bathrooms;

  const _BestHotelData(this.image, this.name, this.price, this.bedrooms, this.bathrooms);
}

class _BestHotelCard extends StatelessWidget {
  final _BestHotelData hotel;

  const _BestHotelCard({required this.hotel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            'assets/images/${hotel.image}',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hotel.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '\$${hotel.price}',
                style: TextStyle(
                  color: appcolors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildAmenity(Icons.bed, '${hotel.bedrooms} Bedroom'),
                  const SizedBox(width: 12),
                  _buildAmenity(Icons.bathtub, '${hotel.bathrooms} Bathroom'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAmenity(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: appcolors.offwhite),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 13, color: appcolors.offwhite),
        ),
      ],
    );
  }
}
