package com.example.genshinimpactcharacterlistapp

import android.content.Intent
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import androidx.recyclerview.widget.LinearLayoutManager
import com.example.genshinimpactcharacterlistapp.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private val list = ArrayList<Character>()
    private lateinit var binding : ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }

        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.rvCharacter.setHasFixedSize(true)
        list.addAll(getListCharater())
        showRecyclerList()
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu, menu)
        return super.onCreateOptionsMenu(menu)
    }


    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        when(item.itemId){
            R.id.action_list->{
                val intent = Intent(this@MainActivity, About::class.java)
                startActivity(intent)
            }
        }

        return super.onOptionsItemSelected(item)
    }
    private fun getListCharater() : ArrayList<Character> {
        val nameCharacter = resources.getStringArray(R.array.data_character)
        val description = resources.getStringArray(R.array.description_character)
        val imgPhoto = resources.getStringArray(R.array.image_character)
        val element = resources.getStringArray(R.array.data_element)
        val nation = resources.getStringArray(R.array.data_nation)
        val gender = resources.getStringArray(R.array.data_gender)
        val weapon = resources.getStringArray(R.array.data_weapon)
        val affiliationCharacter = resources.getStringArray(R.array.affiliation_character)
        val constellationCharacter = resources.getStringArray(R.array.constellation_character)
        val birthdayCharacter = resources.getStringArray(R.array.birthday_character)
        val rarityCharacter = resources.getStringArray(R.array.rarity_character)
        val roleCharacter = resources.getStringArray(R.array.role_character)
        val specialDishCharacter = resources.getStringArray(R.array.special_dish_character)

        val listCharacter = ArrayList<Character>()

        for (i in nameCharacter.indices){
            val character = Character(nameCharacter[i], description[i], imgPhoto[i],
                element[i],
                nation[i],
                gender[i],
                weapon[i],
                affiliationCharacter[i],
                constellationCharacter[i],
                birthdayCharacter[i],
                rarityCharacter[i],
                roleCharacter[i],
                specialDishCharacter[i])
            listCharacter.add(character)
        }
        return listCharacter
    }

    private fun showRecyclerList(){
        binding.rvCharacter.layoutManager = LinearLayoutManager(this)
        val listCharacterAdapter = ListCharacterAdapter(list)
        binding.rvCharacter.adapter = listCharacterAdapter
    }
}
