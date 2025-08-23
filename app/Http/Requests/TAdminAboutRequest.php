<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TAdminAboutRequest extends FormRequest
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
            'individual_title'              => 'nullable|string',
            'business_title'                => 'nullable|string',
            'individual_description'        => 'required',
            'business_description'          => 'nullable',
            'individual_tab_description'    => 'required',
            'business_tab_description'      => 'required',
        ];
    }

    public function messages(): array
    {
         return [
            'individual_title.required' => 'The individual title field is required.',
            'individual_description.required' => 'The individual description field is required.',
            'business_description.required' => 'The business description field is required.',
            'individual_tab_description.required' => 'The individual tab description field is required.',
            'business_tab_description.required' => 'The business tab description field is required.',
        ];
    }
}
