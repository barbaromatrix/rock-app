<?php

namespace App\Http\Controllers;

// Models
use App\Model\Doacao;

// Dependency Injections
use Illuminate\Http\Request;

class DoacaoController extends Controller
{
    
    // Responsável por pegar a lista de doações disponíveis
    public function index()
    {
        return Doacao::getDoacoes();
    }
    
    public function update(Request $request, $id_doacao)
    {
        $doacao = Doacao::findOrFail($id_doacao);
        
        if (!Doacao::updateDoacao($doacao, $request->all())) {
            return response()->json(['description' => 'Tente novamente', 'status' => false], 200);
        }
        
        return response()->json(['description' => 'Atualizado com sucesso', 'status' => true], 200);
    }
}
