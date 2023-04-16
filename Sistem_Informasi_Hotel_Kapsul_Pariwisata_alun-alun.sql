-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2023 at 03:40 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_fasilitas`
--

CREATE TABLE `tb_fasilitas` (
  `id_fasilitas` varchar(255) NOT NULL,
  `jeni_fasilitas` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_hotel`
--

CREATE TABLE `tb_hotel` (
  `id_hotel` varchar(255) NOT NULL,
  `id_jenis_hotel` varchar(255) NOT NULL,
  `Nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `Gambar_hotel` varchar(255) NOT NULL,
  `check_in` varchar(255) NOT NULL,
  `check_out` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_hotel`
--

CREATE TABLE `tb_jenis_hotel` (
  `id_jenis_hotel` varchar(255) NOT NULL,
  `nama_jenis_hotel` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_tempat_wisata`
--

CREATE TABLE `tb_jenis_tempat_wisata` (
  `id_jenis_tempat_wisata` varchar(255) NOT NULL,
  `nama_jenis_wisata` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kamar`
--

CREATE TABLE `tb_kamar` (
  `id_kamar` varchar(255) NOT NULL,
  `id_hotel` varchar(255) NOT NULL,
  `id_fasilitas` varchar(255) NOT NULL,
  `jenis_kamar` varchar(255) NOT NULL,
  `kapasitas_kamar` varchar(255) NOT NULL,
  `status_kamar` varchar(255) NOT NULL,
  `harga_kamar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kriteria_hotel`
--

CREATE TABLE `tb_kriteria_hotel` (
  `id_kriteria_hotel` varchar(255) NOT NULL,
  `id_hotel` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `rating` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_objek_atraksi`
--

CREATE TABLE `tb_objek_atraksi` (
  `id_objek_atraksi` varchar(255) NOT NULL,
  `id_tempat_wisata` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tipe_atraksi` varchar(255) NOT NULL,
  `kapasitas_atraksi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pemesan`
--

CREATE TABLE `tb_pemesan` (
  `id_pemesan` varchar(255) NOT NULL,
  `id_hotel` varchar(255) NOT NULL,
  `id_kamar` varchar(255) NOT NULL,
  `id_tempat_wisata` varchar(255) NOT NULL,
  `id_objek_atraksi` varchar(255) NOT NULL,
  `id_pengguna` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL,
  `total_harga` int(255) NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `tgl_pesan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `jabatan` varchar(255) NOT NULL,
  `no_telp` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_penilaian`
--

CREATE TABLE `tb_penilaian` (
  `id_penilaian` varchar(255) NOT NULL,
  `id_hotel` varchar(255) NOT NULL,
  `id_tempat_wisata` varchar(255) NOT NULL,
  `nilai` varchar(255) NOT NULL,
  `tanggapan` varchar(255) NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `tgl_penilaian` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tempat_wisata`
--

CREATE TABLE `tb_tempat_wisata` (
  `id_tempat_wisata` varchar(255) NOT NULL,
  `id_jenis_tempat_wisata` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL,
  `jam_buka` varchar(255) NOT NULL,
  `jam_tutup` varchar(255) NOT NULL,
  `harga_tiket` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_fasilitas`
--
ALTER TABLE `tb_fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indexes for table `tb_hotel`
--
ALTER TABLE `tb_hotel`
  ADD PRIMARY KEY (`id_hotel`),
  ADD KEY `id_jenis_hotel` (`id_jenis_hotel`);

--
-- Indexes for table `tb_jenis_hotel`
--
ALTER TABLE `tb_jenis_hotel`
  ADD PRIMARY KEY (`id_jenis_hotel`);

--
-- Indexes for table `tb_jenis_tempat_wisata`
--
ALTER TABLE `tb_jenis_tempat_wisata`
  ADD PRIMARY KEY (`id_jenis_tempat_wisata`);

--
-- Indexes for table `tb_kamar`
--
ALTER TABLE `tb_kamar`
  ADD PRIMARY KEY (`id_kamar`),
  ADD KEY `id_hotel` (`id_hotel`),
  ADD KEY `id_fasilitas` (`id_fasilitas`);

--
-- Indexes for table `tb_kriteria_hotel`
--
ALTER TABLE `tb_kriteria_hotel`
  ADD PRIMARY KEY (`id_kriteria_hotel`),
  ADD KEY `id_hotel` (`id_hotel`);

--
-- Indexes for table `tb_objek_atraksi`
--
ALTER TABLE `tb_objek_atraksi`
  ADD PRIMARY KEY (`id_objek_atraksi`),
  ADD KEY `id_tempat_wisata` (`id_tempat_wisata`);

--
-- Indexes for table `tb_pemesan`
--
ALTER TABLE `tb_pemesan`
  ADD PRIMARY KEY (`id_pemesan`),
  ADD KEY `id_hotel` (`id_hotel`),
  ADD KEY `id_kamar` (`id_kamar`),
  ADD KEY `id_tempat_wisata` (`id_tempat_wisata`),
  ADD KEY `id_objek_atraksi` (`id_objek_atraksi`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `id_hotel` (`id_hotel`),
  ADD KEY `id_tempat_wisata` (`id_tempat_wisata`);

--
-- Indexes for table `tb_tempat_wisata`
--
ALTER TABLE `tb_tempat_wisata`
  ADD PRIMARY KEY (`id_tempat_wisata`),
  ADD KEY `id_jenis_tempat_wisata` (`id_jenis_tempat_wisata`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_hotel`
--
ALTER TABLE `tb_hotel`
  ADD CONSTRAINT `tb_hotel_ibfk_1` FOREIGN KEY (`id_jenis_hotel`) REFERENCES `tb_jenis_hotel` (`id_jenis_hotel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_kamar`
--
ALTER TABLE `tb_kamar`
  ADD CONSTRAINT `tb_kamar_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `tb_hotel` (`id_hotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_kamar_ibfk_2` FOREIGN KEY (`id_fasilitas`) REFERENCES `tb_fasilitas` (`id_fasilitas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_kriteria_hotel`
--
ALTER TABLE `tb_kriteria_hotel`
  ADD CONSTRAINT `tb_kriteria_hotel_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `tb_hotel` (`id_hotel`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_objek_atraksi`
--
ALTER TABLE `tb_objek_atraksi`
  ADD CONSTRAINT `tb_objek_atraksi_ibfk_1` FOREIGN KEY (`id_tempat_wisata`) REFERENCES `tb_tempat_wisata` (`id_tempat_wisata`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_pemesan`
--
ALTER TABLE `tb_pemesan`
  ADD CONSTRAINT `tb_pemesan_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `tb_hotel` (`id_hotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesan_ibfk_2` FOREIGN KEY (`id_kamar`) REFERENCES `tb_kamar` (`id_kamar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesan_ibfk_3` FOREIGN KEY (`id_tempat_wisata`) REFERENCES `tb_tempat_wisata` (`id_tempat_wisata`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesan_ibfk_4` FOREIGN KEY (`id_objek_atraksi`) REFERENCES `tb_objek_atraksi` (`id_objek_atraksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pemesan_ibfk_5` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_penilaian`
--
ALTER TABLE `tb_penilaian`
  ADD CONSTRAINT `tb_penilaian_ibfk_1` FOREIGN KEY (`id_hotel`) REFERENCES `tb_hotel` (`id_hotel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_penilaian_ibfk_2` FOREIGN KEY (`id_tempat_wisata`) REFERENCES `tb_tempat_wisata` (`id_tempat_wisata`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_tempat_wisata`
--
ALTER TABLE `tb_tempat_wisata`
  ADD CONSTRAINT `tb_tempat_wisata_ibfk_1` FOREIGN KEY (`id_jenis_tempat_wisata`) REFERENCES `tb_jenis_tempat_wisata` (`id_jenis_tempat_wisata`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
