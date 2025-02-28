# Implementasi
## Double Jump
Nilai jump_count akan ditambahkan ketika pengguna menekan arrow up. Jika jump_count masih kurang dari 2, maka pengguna dapat melakukan jump tambahan dan double jump berhasil diimplementasikan.

## Dash
Pertama-tama, function check_double_tap yang menerima input string dibuat terlebih dahulu. Jika terdapat tombol yang ditekan, maka akan dicek apaka timer berhenti atau last_input == action.name. Jika timer berhenti (yang menandakan bahwa pengguna tidak melakukan double click), var is_double_click akan menjadi false dan last_input akan merekam action yang dilakukan, lalu memulai timer. Jika last_input == action_name, maka is_double_click adalah true dan timer akan berhenti.

Dilakukan pengecekan apakah is_double_click bernilai true. Jika iya, maka dashing bernilai true dan velocity_x akan berubah mengikuti dash_speed. Jika tidak, maka velocity_x akan berjalan seperti walk_speed dari player seperti biasa.

## Mengubah Arah sesuai Arah Jalan Karakter
Ketika pemain menekan ui_left, maka akan $Sprite2D.flip_h akan diset menjadi true supaya arah sprite dapat berubah menghadap ke kiri. Jika pemain menekan ui_right, maka $Sprite2D.flip_h akan diset menjadi false supaya arah sprite dapat berubah menjadi menghadap kanan. though in this case i accidentally used the wrong spritesheet, so the difference is not very apparent... :D

## Reference:
https://www.youtube.com/watch?v=DW4CQoYddXQ&ab_channel=CodingQuests
https://www.youtube.com/watch?v=A-Y1zxJ6oH4&t=2s&ab_channel=SRCoder