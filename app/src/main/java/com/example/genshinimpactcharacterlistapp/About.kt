package com.example.genshinimpactcharacterlistapp

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.example.genshinimpactcharacterlistapp.databinding.ActivityAboutBinding

class About : AppCompatActivity() {


    private lateinit var binding : ActivityAboutBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_about)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
        supportActionBar?.title = "About Page"
        binding = ActivityAboutBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.ig.setOnClickListener{
            val username = "https://www.instagram.com/_u/louis.sxcv"
            val sendIntent = Intent().apply {
                action = Intent.ACTION_VIEW
                data = Uri.parse(username)
                `package`="com.instagram.android"

            }

            if (intent.resolveActivity(packageManager) !=null){
                startActivity(sendIntent)
            } else {
                val sendWeb = Intent().apply {
                    action = Intent.ACTION_VIEW
                    data = Uri.parse("https://www.instagram.com/direct/t/121255552597005")
                }
                startActivity(sendWeb)
            }
        }

        binding.email.setOnClickListener{

            val sendEmail = Intent().apply(){
                action = Intent.ACTION_SENDTO
                putExtra(Intent.EXTRA_SUBJECT, "Fill your Subject")
                putExtra(Intent.EXTRA_TEXT,"Hi Louis, Nice to Meet You")
                data= Uri.parse("mailto:louisginting54@gmail.com")
            }

            if (intent.resolveActivity(packageManager) != null){
                startActivity(sendEmail)
            }
        }
    }

}