import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mebelmutiara/app/modules/commons/API/repository.dart';
import 'package:mebelmutiara/app/modules/database/MdlBarang.dart';


class SliderView extends StatelessWidget {
  final List<Results> banners; // Menerima data dari controller

  SliderView({required this.banners}); // Constructor untuk menerima data

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200, // Atur tinggi slider sesuai kebutuhan
        autoPlay: true, // Otomatis putar slider
        autoPlayInterval: const Duration(seconds: 3), // Interval antara slide
        autoPlayAnimationDuration: const Duration(milliseconds: 800), // Durasi animasi pergeseran
        viewportFraction: 1.0, // Menampilkan satu slide penuh
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
      ),
      items: banners.map((banner) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  '$contentURL/${banner.gambarimage}', // Gunakan URL gambar dari API
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}