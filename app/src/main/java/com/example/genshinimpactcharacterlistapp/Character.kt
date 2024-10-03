package com.example.genshinimpactcharacterlistapp

import android.os.Parcelable
import kotlinx.parcelize.Parcelize

@Parcelize
data class Character (
    val nameCharacter: String,
    val description: String,
    val imgPhoto: String,
    val element: String,
    val nation: String,
    val gender: String,
    val weapon: String,
    val affiliationCharacter : String,
    val constellationCharacter : String,
    val birthdayCharacter : String,
    val rarityCharacter : String,
    val roleCharacter : String,
    val specialDishCharacter : String
) : Parcelable