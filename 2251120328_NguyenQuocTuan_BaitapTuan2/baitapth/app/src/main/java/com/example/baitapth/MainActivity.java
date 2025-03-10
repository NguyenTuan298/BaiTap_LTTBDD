package com.example.baitapth;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

    private EditText edtHovaten, edtTuoi;
    private Button btnKiemtra;
    private TextView txtResult;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);

        // Ánh xạ các thành phần giao diện
        edtHovaten = findViewById(R.id.edtHovaten);
        edtTuoi = findViewById(R.id.edtTuoi);
        btnKiemtra = findViewById(R.id.btnKiemtra);
        txtResult = findViewById(R.id.textViewResult);

        btnKiemtra.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String name = edtHovaten.getText().toString().trim();
                String ageText = edtTuoi.getText().toString().trim();

                // Kiểm tra dữ liệu nhập vào
                if (name.isEmpty() || ageText.isEmpty()) {
                    Toast.makeText(MainActivity.this, "Vui lòng nhập đầy đủ thông tin", Toast.LENGTH_SHORT).show();
                    return;
                }

                // Chuyển đổi tuổi sang số nguyên
                int age;
                try {
                    age = Integer.parseInt(ageText);
                } catch (NumberFormatException e) {
                    Toast.makeText(MainActivity.this, "Vui lòng nhập tuổi hợp lệ", Toast.LENGTH_SHORT).show();
                    return;
                }

                // Xác định nhóm tuổi
                String category;
                if (age > 65) {
                    category = "Người già";
                } else if (age >= 6) {
                    category = "Người lớn";
                } else if (age >= 2) {
                    category = "Trẻ em";
                } else {
                    category = "Em bé";
                }

                // Hiển thị kết quả
                txtResult.setText(name + " thuộc nhóm: " + category);
            }
        });


        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
    }
}