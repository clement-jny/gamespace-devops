import { ApiResponseUser, ApiResponseProducts } from "./types";

const WEB_HOST_PORT = process.env.WEB_HOST_PORT || "3000";
const WEB_URL_ROOT =
	process.env.WEB_URL_ROOT || `http://localhost:${WEB_HOST_PORT}`;

export const apiRegisterUser = async (
	credentials: string
): Promise<ApiResponseUser> => {
	const response = await fetch(`${WEB_URL_ROOT}/api/auth/register`, {
		method: "POST",
		credentials: "include",
		headers: {
			"Content-Type": "application/json",
		},
		body: credentials,
	});

	return await response.json();
};

export const apiLoginUser = async (
	credentials: string
): Promise<ApiResponseUser> => {
	const response = await fetch(`${WEB_URL_ROOT}/api/auth/login`, {
		method: "POST",
		credentials: "include",
		headers: {
			"Content-Type": "application/json",
		},
		body: credentials,
	});

	return await response.json();
};

export const apiGetAuthUser = async (
	username: string
): Promise<ApiResponseUser> => {
	const response = await fetch(`${WEB_URL_ROOT}/api/users/me`, {
		method: "POST",
		credentials: "include",
		headers: {
			"Content-Type": "application/json",
		},
		body: username,
	});

	return await response.json();
};

export const apiGetProfileUser = async (
	username: string
): Promise<ApiResponseUser> => {
	const response = await fetch(`${WEB_URL_ROOT}/api/users/${username}`, {
		method: "GET",
		headers: {
			"Content-Type": "application/json",
		},
	});

	return await response.json();
};

export const apiGetProducts = async (): Promise<ApiResponseProducts> => {
	const response = await fetch(`${WEB_URL_ROOT}/api/products`, {
		method: "GET",
		headers: {
			"Content-Type": "application/json",
		},
	});

	return await response.json();
};

export const apiGetPlatformProducts = async (
	platform: string
): Promise<ApiResponseProducts> => {
	const response = await fetch(`${WEB_URL_ROOT}/api/products/${platform}`, {
		method: "GET",
		headers: {
			"Content-Type": "application/json",
		},
	});

	return await response.json();
};
