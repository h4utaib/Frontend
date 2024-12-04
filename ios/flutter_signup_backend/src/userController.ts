import { Request, Response } from 'express';
import bcrypt from 'bcrypt';
import { db } from './db';

// Sign-Up Handler
export const signup = async (req: Request, res: Response) => {
  const { username, email, firstName, lastName, password } = req.body;

  if (!username || !email || !firstName || !lastName || !password) {
    return res.status(400).json({ message: 'All fields are required' });
  }

  try {
    const hashedPassword = await bcrypt.hash(password, 10);

    const query = `INSERT INTO users (username, email, first_name, last_name, password) VALUES (?, ?, ?, ?, ?)`;
    await db.execute(query, [username, email, firstName, lastName, hashedPassword]);

    res.status(201).json({ message: 'User registered successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Error registering user' });
  }
};