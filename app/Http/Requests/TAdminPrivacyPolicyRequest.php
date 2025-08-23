<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TAdminPrivacyPolicyRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'title'              => 'nullable|string',
            'description'        => 'required',
        ];
    }

    public function messages(): array
    {
         return [
            'description.required' => 'The description field is required.',
        ];
    }
}
