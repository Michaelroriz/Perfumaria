/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.senac.sp.perfumaria.pi3.model;

import java.sql.Date;

/**
 *
 * @author Michael
 */
public class Venda {
    private int id;
    private int quantidade;
    private Date dt_venda;
    private String[] produtos;



    public Venda(int quantidade, String[] produtos) {
        this.quantidade = quantidade;
        this.produtos = produtos;
    }
    
    
    public String[] getProdutos() {
        return produtos;
    }

    public void setProdutos(String[] produtos) {
        this.produtos = produtos;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public Date getDt_venda() {
        return dt_venda;
    }

    public void setDt_venda(Date dt_venda) {
        this.dt_venda = dt_venda;
    }        
}
