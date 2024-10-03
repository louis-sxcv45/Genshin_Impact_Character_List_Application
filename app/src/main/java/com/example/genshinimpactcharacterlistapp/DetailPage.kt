package com.example.genshinimpactcharacterlistapp

import android.os.Build
import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import com.bumptech.glide.Glide
import com.example.genshinimpactcharacterlistapp.databinding.ActivityDetailPageBinding

class DetailPage : AppCompatActivity() {
    companion object{
        const val EXTRA_PERSON = "extra_person"
    }

    private lateinit var binding : ActivityDetailPageBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_detail_page)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        binding = ActivityDetailPageBinding.inflate(layoutInflater)
        setContentView(binding.root)
        val dataCharacter = if (Build.VERSION.SDK_INT >= 33) {
            intent.getParcelableExtra<Character>(EXTRA_PERSON, Character::class.java)
        } else {
            @Suppress("DEPRECATION")
            intent.getParcelableExtra<Character>(EXTRA_PERSON)
        }

        Glide.with(this)
            .load(dataCharacter?.imgPhoto)
            .into(binding.characterImage)
        binding.tvName.text = dataCharacter?.nameCharacter
        binding.tvDescription.text = dataCharacter?.description
        binding.tvElement.text = dataCharacter?.element
        binding.tvNation.text = dataCharacter?.nation
        binding.tvGender.text = dataCharacter?.gender
        binding.tvWeapon.text = dataCharacter?.weapon
        binding.tvAffiliation.text = dataCharacter?.affiliationCharacter
        binding.tvConstellation.text = dataCharacter?.constellationCharacter
        binding.tvBirthday.text = dataCharacter?.birthdayCharacter
        binding.tvRarity.text = dataCharacter?.rarityCharacter
        binding.tvRole.text = dataCharacter?.roleCharacter
        binding.tvSpecialDish.text = dataCharacter?.specialDishCharacter

        supportActionBar?.title = dataCharacter?.nameCharacter
    }
}