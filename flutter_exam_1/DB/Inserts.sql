
INSERT INTO users (name, email, password) VALUES
('John Doe', 'john@example.com', 'hashedpassword123'),
('Rodrigo', 'rodrigo@example.com', 'moviles2025');

INSERT INTO articles (name, seller, rating, img_url) VALUES
('Smartphone X10', 'TechStore', 4.8, 'assets/smartphone.jpg'),
('Wireless Headphones', 'AudioPlus', 4.5, 'assets/headphones.jpg'),
('Gaming Laptop', 'ProComputers', 9.9, 'assets/gaming_laptop.jpg'),
('4K TV 55 Inches', 'HomeElectro', 4.6, 'assets/4k_tv_55.jpg'),
('Bluetooth Speaker', 'SoundWave', 4.2, 'assets/bluetooth_speaker.jpg'),
('Smartwatch Pro', 'FitGadgets', 4.7, 'assets/smartwatch_pro.jpg'),
('Mechanical Keyboard', 'KeyMaster', 4.4, 'assets/mechanical_keyboard.jpg'),
('Ergonomic Mouse', 'ErgoTech', 4.1, 'assets/ergonomic_mouse.jpg'),
('USB-C Charger', 'PowerHub', 4.3, 'assets/usb_c_charger.jpg'),
('External SSD 1TB', 'DataPlus', 4.9, 'assets/external_ssd_1tb.jpg'),
('Drone Explorer', 'SkyTech', 4.6, 'assets/drone_explorer.jpg'),
('Action Camera', 'GoSharp', 4.5, 'assets/action_camera.jpg'),
('Wireless Router', 'NetConnect', 4.0, 'assets/wireless_router.jpg'),
('Electric Kettle', 'HomeBasics', 4.3, 'assets/electric_kettle.jpg'),
('Air Fryer', 'KitchenPro', 4.6, 'assets/air_fryer.jpg'),
('Smart Home Hub', 'SmartLiving', 4.5, 'assets/smart_home_hub.jpg'),
('LED Desk Lamp', 'LightWorks', 4.2, 'assets/led_desk_lamp.jpg'),
('Portable Projector', 'VisionTech', 4.4, 'assets/portable_projector.jpg'),
('Fitness Tracker', 'FitLife', 4.1, 'assets/fitness_tracker.jpg'),
('Soundbar 2.1', 'AudioPro', 4.5, 'assets/soundbar_21.jpg');


INSERT INTO favorites (user_id, article_id) VALUES
(1, 1),
(1, 3),
(1, 7),
(1, 10),
(1, 15),

(2, 2),
(2, 4),
(2, 6),
(2, 12),
(2, 20);
