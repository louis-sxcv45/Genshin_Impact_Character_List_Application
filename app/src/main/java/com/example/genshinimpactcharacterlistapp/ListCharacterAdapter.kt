package com.example.genshinimpactcharacterlistapp

import android.content.Intent
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import com.example.genshinimpactcharacterlistapp.databinding.ItemRowCharacterBinding


class ListCharacterAdapter(private val listcharacter: ArrayList<Character>) : RecyclerView.Adapter<ListCharacterAdapter.ViewHolder>() {

    class ViewHolder(var binding: ItemRowCharacterBinding) : RecyclerView.ViewHolder(binding.root)

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): ViewHolder {
        val binding = ItemRowCharacterBinding.inflate(LayoutInflater.from(parent.context), parent, false)
        return ViewHolder(binding)
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val (nameCharacter,description, imgPhoto) = listcharacter[position]
        holder.binding.tvCharacter.text = nameCharacter
        holder.binding.tvDescription.text = description

        Glide.with(holder.binding.imageCharacter.context)
            .load(imgPhoto)
            .into(holder.binding.imageCharacter)

        holder.binding.cardView.setOnClickListener{
           val context = holder.itemView.context
            val intent = Intent(context, DetailPage::class.java)
            intent.putExtra(DetailPage.EXTRA_PERSON, listcharacter[holder.adapterPosition])
            holder.itemView.context.startActivity(intent)
        }
    }

    override fun getItemCount(): Int = listcharacter.size
}